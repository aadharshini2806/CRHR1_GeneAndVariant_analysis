# CRHR1_GeneAndVariant_analysis

Objective:

To Investigate the variants associated with the cortisol Reseasing Hormone Receptor 1(CRHR1) gene and uncover their biological significance

Workflow:

Choose the gene -> Get all variants from Ensembl -> Extract only the rsIDs and paste in VEP -> Analyse annotation scores(SIFT, PolyPhen, CADD, REVEL) -> Check any match in GWAS associations for CRHR1 -> Regulomedb to check which variants are in regulatory sequences -> New analysis in Ensembl VEP -> Missense consequence (moderate), check if variant is deletorious and damaging(scores) -> Biological Interpretation

Results:

None of the variants obtained in Ensembl was found in ClinVar, since it shows data that are only clinically evaluated. Moreover, after a simple analysis in R, it has been found that there are no matches with the GWAS association data. This reveals that CHRH1 gene variants are not clinically studied and observed in a typical population. 

Regulomedb evaluated the filtered variants(SIFT<=0.05, PolyPhen>=0.49, CADD >=30) and displayed the top 5 variants (with a rank of 2b), which is a good enough proof that the selected variants are found in the regulatory region. After a further analysis of the 5 variants in Ensembl VEP, it is seen that rs200468311 is a variant of uncertain significance(VUS), with an allele frequency(AF) of 0.0002. Also, the variant rs530958757 has an allele frequency of 0.0004, proving that these are indeed rare mutations in a population.

All of these variants with missense consequence are found to be deletorious(SIFT = 0) and possibly/probably damaging(PolyPhen scores) through computational analysis, yet, there are not clinically evaluated and are concluded to be really rare in the population. Further research should be conducted to uncover more biological insights.
