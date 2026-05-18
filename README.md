**Pipeline Summary**

FASTQ → QC → Alignment → BAM processing → Variant calling → Filtering → Annotation → Visualization

**VariantCalling_Pipeline_TumorNormal**
Hybrid pipeline (Bash + Python) for tumor–normal paired variant calling, annotation, and visualization.

This repository provides a modular and reproducible workflow for detecting, filtering, annotating, and visualizing somatic and germline variants from next-generation sequencing (NGS) data. The project integrates standard variant calling tools with Python-based downstream analysis and visualization.

**Project Scope**

A modular and reproducible Python-based pipeline for variant calling, filtering, annotation, and visualization of next-generation sequencing (NGS) data from tumor–normal paired samples.

**Dataset Information**

- Data Type: Whole-exome or whole-genome sequencing (FASTQ / BAM / CRAM)

- Biological Context: Tumor-normal paired samples

- Source: Public datasets (e.g., TCGA, 1000 Genomes) or custom sequencing experiments

- Note: Raw sequencing data are not included in this repository.

**Research Objective**

To identify and characterize candidate somatic and germline variants in tumor–normal paired samples, followed by functional annotation and visualization of mutational patterns using a reproducible computational workflow.

**Tools & Packages**

### Programming Language
- Python ≥ 3.8

### Python Libraries
- pysam – BAM/SAM file processing
- cyvcf2 / PyVCF – VCF parsing
- pandas, numpy – data manipulation
- matplotlib, seaborn – data visualization

### Bioinformatics Tools
- FastQC – sequencing quality control
- BWA-MEM – read alignment
- SAMtools – BAM processing, sorting, indexing
- bcftools – variant manipulation and filtering
- GATK – variant calling and post-processing
All command-line tools were executed in a Linux environment using WSL2



**Analysis Workflow**

1. **Preprocessing (01_Preprocessing.sh)**

- Alignment of raw FASTQ files (if required)

- Sorting and indexing BAM files

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
│   ├── 01_Preprocessing.sh
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

## Outputs

The pipeline generates:

- Raw and filtered VCF files
- Annotated variant tables
- QC metrics (alignment statistics, flagstat reports)
- Variant distribution plots
- Mutation summaries (SNVs, indels, gene-level variation)


**Example Results (Demonstration)**

(These values are illustrative and will vary depending on dataset, coverage, and reference genome)

- Total variants detected: ~10,000

- High-confidence variants: ~3,000

- Genes affected: ~1,000+



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

**Computational Environment**

This pipeline was developed and executed using:

- Windows 11
- Windows Subsystem for Linux (WSL2)
- Ubuntu Linux environment

This setup enables execution of standard Linux-based bioinformatics tools on a Windows system.




