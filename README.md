**GSE114725_VariantCalling_Python**

Python pipeline for tumor-normal paired variant calling, annotation, and visualization.
This repository provides a reproducible workflow for detecting, filtering, annotating, and visualizing somatic and germline variants from tumor-normal paired sequencing data. The project integrates standard variant calling tools with Python-based analysis and visualization.

**Dataset Information**

- **Data Type**: Whole-exome or whole-genome sequencing (FASTQ / BAM / CRAM)

- **Biological Context**: Tumor-normal paired samples

- **Source**: Public datasets (e.g., TCGA, 1000 Genomes) or custom sequencing experiments

Note: Raw sequencing data are not included in this repository.

**Research Objective**
To identify high-confidence somatic and germline variants in tumor-normal paired samples, annotate their functional impact, and summarize mutational patterns across samples.

**Tools & Packages**
- **Python 3.8+**
- **pysam** – BAM file processing
- **PyVCF / cyvcf2** – VCF parsing
- **pandas, numpy** – Data manipulation
- **matplotlib, seaborn** – Visualization of variant distributions
- **bcftools / samtools (system calls)** – Variant calling and BAM processing



**Analysis Workflow**

**Preprocessing (01_Preprocessing.py)**
- Align raw FASTQ files (if needed)
- Generate BAM files and sort/index

**Variant Calling (02_VariantCalling.py)**
- Detect somatic and germline variants using tumor-normal paired samples
- Output: raw VCF files

**Filtering (03_Filtering.py)**
- Remove low-quality and low-depth variants
- Optional: Apply allele frequency or strand bias filters

**Annotation (04_Annotation.py)**
- Annotate variants with gene context, functional impact, and known databases
- Tools: ANNOVAR, VEP, or custom Python scripts

**Visualization (05_Visualization.py)**
- Generate plots for:
- Variant types (SNV, Indel)
- Variant counts per sample
- Mutational spectra
- Top mutated genes

**Repository Structure**

```GSE114725_VariantCalling_Python/

├── scripts/
│   ├── 01_Preprocessing.py        # Alignment and BAM processing
│   ├── 02_VariantCalling.py       # Variant calling
│   ├── 03_Filtering.py            # Filtering low-quality variants
│   ├── 04_Annotation.py           # Variant annotation
│   └── 05_Visualization.py        # Plots and mutational summaries
├── data/
│   ├── raw/                       # Raw FASTQ / BAM files
│   └── processed/                 # Filtered VCF and annotation files
├── figures/                       # Output plots
└── README.md                      # Project description and instructions
```
**Key Outputs**
- High-confidence VCF files (somatic and germline)
- Annotated variant tables
- Mutational summaries and visualizations
- Per-sample variant distributions
- Plots highlighting top mutated genes and variant types

**Limitations**
- Variant calling accuracy depends on coverage, sequencing quality, and tumor purity
- Functional annotation relies on external databases (may be incomplete)
- Visualization scripts are tailored for small to medium datasets; may require optimization for large cohorts

**Future Directions**
- Integration with additional datasets for cohort-level analysis
- Support for multi-sample joint calling
- Inclusion of copy number variation (CNV) analysis
- Interactive dashboards for variant exploration (Plotly / Dash)

**Data Availability**
- Raw sequencing data should be sourced externally (public repositories or institutional datasets)
- Processed files generated from scripts are stored in data/processed/
