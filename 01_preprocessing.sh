#!/bin/bash

# =========================================================
# Step 1: Preprocessing Pipeline (NGS Variant Calling)
# FASTQ → QC → Alignment → BAM processing
#
# Environment: WSL2 (Windows Subsystem for Linux)
# Tools: FastQC, BWA-MEM, SAMtools
# =========================================================

set -e

# ----------------------------
# File paths "/mnt/c/Users/USERNAME/tmp"
# ----------------------------
FASTQ_DIR="/mnt/c/Users/USERNAME/tmp/sra"
REF="/mnt/c/Users/USERNAME/tmp/Referencefile/chr22.fa"
OUT_DIR="/mnt/c/Users/USERNAME/tmp/results"

mkdir -p $OUT_DIR

echo "===================================="
echo "STEP 1: QUALITY CONTROL (FASTQC)"
echo "===================================="

fastqc $FASTQ_DIR/SRR1518158_1.fastq -o $OUT_DIR
fastqc $FASTQ_DIR/SRR1518158_2.fastq -o $OUT_DIR


echo "===================================="
echo "STEP 2: ALIGNMENT (BWA-MEM)"
echo "===================================="

bwa mem -t 4 \
-R "@RG\tID:SRR1518158\tSM:SRR1518158\tPL:ILLUMINA" \
$REF \
$FASTQ_DIR/SRR1518158_1.fastq \
$FASTQ_DIR/SRR1518158_2.fastq \
> $OUT_DIR/aligned.sam


echo "===================================="
echo "STEP 3: SAM → BAM"
echo "===================================="

samtools view -Sb $OUT_DIR/aligned.sam > $OUT_DIR/aligned.bam


echo "===================================="
echo "STEP 4: SORT BAM"
echo "===================================="

samtools sort $OUT_DIR/aligned.bam -o $OUT_DIR/aligned_sorted.bam


echo "===================================="
echo "STEP 5: INDEX BAM"
echo "===================================="

samtools index $OUT_DIR/aligned_sorted.bam


echo "===================================="
echo "STEP 6: ALIGNMENT STATS"
echo "===================================="

samtools flagstat $OUT_DIR/aligned_sorted.bam > $OUT_DIR/flagstat.txt



