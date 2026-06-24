getwd()
library(tidyverse)
variants <- read.csv("C:/Bioinformatics_miniprojects/CRHR1_Variant_analysis/CRHR1_Variant_analysis/data_raw/ensembl-export (1).csv")
deletorious <- variants %>%
  filter(SIFT <= 0.05, PolyPhen >= 0.49, CADD >=30)                 #Filter possibly and probably damaging variants
gwas <- read.delim("C:/Bioinformatics_miniprojects/CRHR1_Variant_analysis/CRHR1_Variant_analysis/gwas-association-downloaded_2026-06-24-ensemblMappedGenes_CRHR1.tsv")
head(colnames(deletorious), 30)
head(colnames(gwas), 30)
head(deletorious$Variant.ID, 216)
unique_variants <- unique(deletorious)     #to remove repeated variants
length(unique_variants)
head(gwas$SNPS)      
merged <- merge(
  deletorious,
  gwas,
  by.x = "Variant.ID",
  by.y = "SNPS" )
head(merged)
sum(deletorious$Variant.ID %in% gwas$SNPS)      #to check identical variants in both databases

#filter ensembl vep data obtained after Regulomedb analysis
library(readxl)  #to read excel files
filtered_variants <- read_excel("C:/Bioinformatics_miniprojects/CRHR1_Variant_analysis/CRHR1_Variant_analysis/results/Ensembl_VEP_5variants.xlsx")
dim(filtered_variants)
head(filtered_variants$Consequence)
colnames(filtered_variants)
missense_variants <- filtered_variants[filtered_variants$Consequence=="missense_variant" & filtered_variants$MANE=="MANE_Select" ,]
colnames(missense_variants)[colnames(missense_variants) == "#Uploaded_variation"] <- "Variant_ID"
#Filter consequence and MANE
head(
  missense_variants[, c("Variant_ID", "Consequence", "SIFT", "PolyPhen", "CADD_PHRED", "AF", "CLIN_SIG", "REVEL")],
  10)                                       #Output gives only 7 rows, consistent with the ensembl VEP data
output <- missense_variants[, c(
  "Variant_ID",
  "Consequence",
  "SIFT",
  "PolyPhen",
  "CADD_PHRED", "AF", "CLIN_SIG", "REVEL"
)]
write.csv(output, "top_missense_variants.csv", row.names = FALSE)   #Saves the output in a file

