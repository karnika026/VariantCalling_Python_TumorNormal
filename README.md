**GSE114725_VariantCalling_Python**

Python-based pipeline for tumor–normal paired variant calling, annotation, and visualization.

This repository provides a modular and reproducible workflow for detecting, filtering, annotating, and visualizing somatic and germline variants from next-generation sequencing (NGS) data. The project integrates standard variant calling tools with Python-based downstream analysis and visualization.

**Project Scope**

This project focuses on building a flexible and reusable variant calling framework rather than analyzing a single fixed dataset.
The pipeline is designed to be easily applied to tumor–normal paired sequencing datasets from public repositories or custom experiments.

**Dataset Information**

- Data Type: Whole-exome or whole-genome sequencing (FASTQ / BAM / CRAM)

- Biological Context: Tumor-normal paired samples

- Source: Public datasets (e.g., TCGA, 1000 Genomes) or custom sequencing experiments

- Note: Raw sequencing data are not included in this repository.

**Research Objective**

To identify high-confidence somatic and germline variants in tumor–normal paired samples, annotate their functional impact, and summarize mutational patterns using reproducible computational workflows.

**Tools & Packages**

- Python 3.8+
- pysam – BAM file processing
- PyVCF / cyvcf2 – VCF parsing
- pandas, numpy – Data manipulation
- matplotlib, seaborn – Visualization of variant distributions
- bcftools / samtools (system calls) – Variant calling and BAM processing


**Analysis Workflow**

1. **Preprocessing (01_Preprocessing.py)**

- Alignment of raw FASTQ files (if required)

- BAM file generation, sorting, and indexing

2. **Variant Calling (02_VariantCalling.py)**

- Detection of somatic and germline variants

- Output: raw VCF files

3. **Filtering (03_Filtering.py)**

- Removal of low-quality and low-depth variants

**Optional filters:**

- Allele frequency

- Strand bias

4. **Annotation (04_Annotation.py)**

- Functional annotation of variants

- Gene context and predicted impact

- Integration with annotation tools (ANNOVAR / VEP)

5. **Visualization (05_Visualization.py)**

- Variant type distribution (SNV vs Indel)

- Variant counts per sample

- Mutational spectra

- Top mutated genes

**Repository Structure**
```
├── scripts/
│   ├── 01_Preprocessing.py
│   ├── 02_VariantCalling.py
│   ├── 03_Filtering.py
│   ├── 04_Annotation.py
│   └── 05_Visualization.py
│
├── data/
│   ├── raw/
│   └── processed/
│
├── figures/
│
└── README.md
```

**Example Outputs**

The pipeline generates:
- Raw and filtered VCF files
- Annotated variant tables
- Summary statistics:

   - Total variant counts

   - SNV vs Indel distribution

   - Variant quality metrics

- Visualization plots:

  - Variant type distribution

  - Mutation burden

  - Top mutated genes

**Example Results (Demonstration)**

(Results will vary depending on input dataset)

- Total variants detected: ~10,000

- High-confidence variants: ~3,000

- Genes affected: ~1,000+

**Key Outputs**

- High-confidence VCF files (somatic and germline)

- Annotated variant tables

- Mutational summaries and visualizations

- Per-sample variant distributions

- Plots highlighting top mutated genes and variant types

**Limitations**

- Variant calling accuracy depends on sequencing depth and tumor purity

- Annotation relies on external databases that may be incomplete

- Pipeline is optimized for small-to-medium datasets and may require scaling for large cohorts

**Future Directions**

- Integration with cohort-level analyses

- Multi-sample joint variant calling

- Copy number variation (CNV) analysis

- Interactive dashboards (Plotly / Dash)

- Integration with transcriptomic or multi-omics datasets

**Data Availability**

- Raw sequencing data should be obtained from public repositories or user datasets

- Processed outputs are generated and stored in data/processed/




