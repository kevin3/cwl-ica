
UMCCR CWL-ICA Catalogue
=======================

## Table of Contents
  
- [Expressions](#expressions)  
- [Tools](#tools)  
- [Workflows](#workflows)
## Expressions

### Expressions ToC
  
- [get-faidx-file-from-reference-file](#get-faidx-file-from-reference-file)  
- [create-contig-obj-for-hla-chr6-region](#create-contig-obj-for-hla-chr6-region)  
- [get-samplesheet-midfix-regex](#get-samplesheet-midfix-regex)  
- [flatten-array-fastq-list](#flatten-array-fastq-list)  
- [parse-int-array](#parse-int-array)  
- [parse-int](#parse-int)  
- [parse-file](#parse-file)  
- [get-compressed-vcf-file-from-directory](#get-compressed-vcf-file-from-directory)  
- [get-custom-output-dir-entry-for-tso500-post-processing](#get-custom-output-dir-entry-for-tso500-post-processing)  
- [get-bam-file-from-directory](#get-bam-file-from-directory)  
- [create-predefined-mount-paths-and-umccrise-row-from-umccrise-schema](#create-predefined-mount-paths-and-umccrise-row-
from-umccrise-schema)  


### get-faidx-file-from-reference-file

#### Versions
  
- [1.0.0](.github/catalogue/docs/expressions/get-faidx-file-from-reference-file/1.0.0/get-faidx-file-from-reference-file__1.0.0.md)  


### create-contig-obj-for-hla-chr6-region

#### Versions
  
- [1.0.0](.github/catalogue/docs/expressions/create-contig-obj-for-hla-chr6-region/1.0.0/create-contig-obj-for-hla-chr6-region__1.0.0.md)  


### get-samplesheet-midfix-regex

#### Versions
  
- [1.0.0](.github/catalogue/docs/expressions/get-samplesheet-midfix-regex/1.0.0/get-samplesheet-midfix-regex__1.0.0.md)  


### flatten-array-fastq-list

#### Versions
  
- [1.0.0](.github/catalogue/docs/expressions/flatten-array-fastq-list/1.0.0/flatten-array-fastq-list__1.0.0.md)  


### parse-int-array

#### Versions
  
- [1.0.0](.github/catalogue/docs/expressions/parse-int-array/1.0.0/parse-int-array__1.0.0.md)  


### parse-int

#### Versions
  
- [1.0.0](.github/catalogue/docs/expressions/parse-int/1.0.0/parse-int__1.0.0.md)  


### parse-file

#### Versions
  
- [1.0.0](.github/catalogue/docs/expressions/parse-file/1.0.0/parse-file__1.0.0.md)  


### get-compressed-vcf-file-from-directory

#### Versions
  
- [1.0.0](.github/catalogue/docs/expressions/get-compressed-vcf-file-from-directory/1.0.0/get-compressed-vcf-file-from-directory__1.0.0.md)  


### get-custom-output-dir-entry-for-tso500-post-processing

#### Versions
  
- [1.0.0](.github/catalogue/docs/expressions/get-custom-output-dir-entry-for-tso500-post-processing/1.0.0/get-custom-output-dir-entry-for-tso500-post-processing__1.0.0.md)  


### get-bam-file-from-directory

#### Versions
  
- [1.0.0](.github/catalogue/docs/expressions/get-bam-file-from-directory/1.0.0/get-bam-file-from-directory__1.0.0.md)  


### create-predefined-mount-paths-and-umccrise-row-from-umccrise-schema

#### Versions
  
- [1.2.1--0](.github/catalogue/docs/expressions/create-predefined-mount-paths-and-umccrise-row-from-umccrise-schema/1.2.1--0/create-predefined-mount-paths-and-umccrise-row-from-umccrise-schema__1.2.1--0.md)  
- [1.2.2--0](.github/catalogue/docs/expressions/create-predefined-mount-paths-and-umccrise-row-from-umccrise-schema/1.2.2--0/create-predefined-mount-paths-and-umccrise-row-from-umccrise-schema__1.2.2--0.md)  


## Tools

### Tools ToC
  
- [samtools-merge](#samtools-merge)  
- [tabix](#tabix)  
- [sambamba-merge-and-index](#sambamba-merge-and-index)  
- [sambamba-sort-and-index](#sambamba-sort-and-index)  
- [sambamba-slice-and-index](#sambamba-slice-and-index)  
- [sambamba-view-and-index](#sambamba-view-and-index)  
- [optitype](#optitype)  
- [custom-subset-bam](#custom-subset-bam)  
- [custom-hla-bed-from-faidx](#custom-hla-bed-from-faidx)  
- [bedops](#bedops)  
- [dragen-germline](#dragen-germline)  
- [custom-create-tso500-samplesheet](#custom-create-tso500-samplesheet)  
- [tso500-ctdna-demultiplex-workflow](#tso500-ctdna-demultiplex-workflow)  
- [tso500-ctdna-analysis-workflow](#tso500-ctdna-analysis-workflow)  
- [tso500-ctdna-reporting-workflow](#tso500-ctdna-reporting-workflow)  
- [custom-samplesheet-split-by-settings](#custom-samplesheet-split-by-settings)  
- [bclConvert](#bclconvert)  
- [create-dummy-file](#create-dummy-file)  
- [multiqc-interop](#multiqc-interop)  
- [dragen-somatic](#dragen-somatic)  
- [dragen-transcriptome](#dragen-transcriptome)  
- [arriba-fusion-calling](#arriba-fusion-calling)  
- [arriba-drawing](#arriba-drawing)  
- [multiqc](#multiqc)  
- [dragen-alignment](#dragen-alignment)  
- [custom-create-directory](#custom-create-directory)  
- [dragen-build-reference-tarball](#dragen-build-reference-tarball)  
- [bgzip](#bgzip)  
- [mosdepth](#mosdepth)  
- [custom-tso500-make-region-coverage-qc](#custom-tso500-make-region-coverage-qc)  
- [custom-tso500-make-exon-coverage-qc](#custom-tso500-make-exon-coverage-qc)  
- [custom-tso500-align-collapse-fusion-caller-csv-metrics-to-json](#custom-tso500-align-collapse-fusion-caller-csv-
metrics-to-json)  
- [custom-tsv-to-json](#custom-tsv-to-json)  
- [custom-tar-vcf-file-list](#custom-tar-vcf-file-list)  
- [custom-gzip-file](#custom-gzip-file)  
- [custom-tar-file-list](#custom-tar-file-list)  
- [custom-create-umccrise-tsv](#custom-create-umccrise-tsv)  
- [umccrise](#umccrise)  
- [custom-create-umccr-dragen-refdata-tarball-from-illumina-tar](#custom-create-umccr-dragen-refdata-tarball-from-
illumina-tar)  
- [dragen-umi](#dragen-umi)  
- [bcftools-view](#bcftools-view)  
- [rnasum](#rnasum)  


### samtools-merge

#### Categories
  
- bam handlers  


#### Versions
  
- [1.12.0](.github/catalogue/docs/tools/samtools-merge/1.12.0/samtools-merge__1.12.0.md)  


### tabix

#### Versions
  
- [0.2.6](.github/catalogue/docs/tools/tabix/0.2.6/tabix__0.2.6.md)  


### sambamba-merge-and-index

#### Versions
  
- [0.8.0](.github/catalogue/docs/tools/sambamba-merge-and-index/0.8.0/sambamba-merge-and-index__0.8.0.md)  


### sambamba-sort-and-index

#### Categories
  
- bam handler  


#### Versions
  
- [0.8.0](.github/catalogue/docs/tools/sambamba-sort-and-index/0.8.0/sambamba-sort-and-index__0.8.0.md)  


### sambamba-slice-and-index

#### Categories
  
- bam handler  


#### Versions
  
- [0.8.0](.github/catalogue/docs/tools/sambamba-slice-and-index/0.8.0/sambamba-slice-and-index__0.8.0.md)  


### sambamba-view-and-index

#### Categories
  
- bam handler  


#### Versions
  
- [0.8.0](.github/catalogue/docs/tools/sambamba-view-and-index/0.8.0/sambamba-view-and-index__0.8.0.md)  


### optitype

#### Categories
  
- hla  


#### Versions
  
- [1.3.5](.github/catalogue/docs/tools/optitype/1.3.5/optitype__1.3.5.md)  


### custom-subset-bam

#### Categories
  
- bam handler  


#### Versions
  
- [1.12.0](.github/catalogue/docs/tools/custom-subset-bam/1.12.0/custom-subset-bam__1.12.0.md)  


### custom-hla-bed-from-faidx

#### Versions
  
- [1.0.0](.github/catalogue/docs/tools/custom-hla-bed-from-faidx/1.0.0/custom-hla-bed-from-faidx__1.0.0.md)  


### bedops

#### Versions
  
- [2.4.39](.github/catalogue/docs/tools/bedops/2.4.39/bedops__2.4.39.md)  


### dragen-germline

#### Versions
  
- [3.7.5](.github/catalogue/docs/tools/dragen-germline/3.7.5/dragen-germline__3.7.5.md)  
- [3.9.3](.github/catalogue/docs/tools/dragen-germline/3.9.3/dragen-germline__3.9.3.md)  


### custom-create-tso500-samplesheet

#### Categories
  
- tso500  


#### Versions
  
- [1.0.0](.github/catalogue/docs/tools/custom-create-tso500-samplesheet/1.0.0/custom-create-tso500-samplesheet__1.0.0.md)  


### tso500-ctdna-demultiplex-workflow

#### Categories
  
- tso500  


#### Versions
  
- [1.1.0--120](.github/catalogue/docs/tools/tso500-ctdna-demultiplex-workflow/1.1.0--120/tso500-ctdna-demultiplex-workflow__1.1.0--120.md)  


### tso500-ctdna-analysis-workflow

#### Categories
  
- tso500  


#### Versions
  
- [1.1.0--120](.github/catalogue/docs/tools/tso500-ctdna-analysis-workflow/1.1.0--120/tso500-ctdna-analysis-workflow__1.1.0--120.md)  


### tso500-ctdna-reporting-workflow

#### Categories
  
- tso500  


#### Versions
  
- [1.1.0--120](.github/catalogue/docs/tools/tso500-ctdna-reporting-workflow/1.1.0--120/tso500-ctdna-reporting-workflow__1.1.0--120.md)  


### custom-samplesheet-split-by-settings

#### Versions
  
- [1.0.0](.github/catalogue/docs/tools/custom-samplesheet-split-by-settings/1.0.0/custom-samplesheet-split-by-settings__1.0.0.md)  


### bclConvert

#### Versions
  
- [3.7.5](.github/catalogue/docs/tools/bclConvert/3.7.5/bclConvert__3.7.5.md)  


### create-dummy-file

#### Versions
  
- [1.0.0](.github/catalogue/docs/tools/create-dummy-file/1.0.0/create-dummy-file__1.0.0.md)  


### multiqc-interop

#### Versions
  
- [1.2.1](.github/catalogue/docs/tools/multiqc-interop/1.2.1/multiqc-interop__1.2.1.md)  


### dragen-somatic

#### Versions
  
- [3.7.5](.github/catalogue/docs/tools/dragen-somatic/3.7.5/dragen-somatic__3.7.5.md)  
- [3.9.3](.github/catalogue/docs/tools/dragen-somatic/3.9.3/dragen-somatic__3.9.3.md)  


### dragen-transcriptome

#### Versions
  
- [3.7.5](.github/catalogue/docs/tools/dragen-transcriptome/3.7.5/dragen-transcriptome__3.7.5.md)  
- [3.8.4](.github/catalogue/docs/tools/dragen-transcriptome/3.8.4/dragen-transcriptome__3.8.4.md)  
- [3.9.3](.github/catalogue/docs/tools/dragen-transcriptome/3.9.3/dragen-transcriptome__3.9.3.md)  


### arriba-fusion-calling

#### Versions
  
- [2.0.0](.github/catalogue/docs/tools/arriba-fusion-calling/2.0.0/arriba-fusion-calling__2.0.0.md)  


### arriba-drawing

#### Versions
  
- [2.0.0](.github/catalogue/docs/tools/arriba-drawing/2.0.0/arriba-drawing__2.0.0.md)  


### multiqc

#### Categories
  
- qc  
- visual  


#### Versions
  
- [1.10.1](.github/catalogue/docs/tools/multiqc/1.10.1/multiqc__1.10.1.md)  
- [1.11.0](.github/catalogue/docs/tools/multiqc/1.11.0/multiqc__1.11.0.md)  


### dragen-alignment

#### Versions
  
- [3.7.5](.github/catalogue/docs/tools/dragen-alignment/3.7.5/dragen-alignment__3.7.5.md)  
- [3.9.3](.github/catalogue/docs/tools/dragen-alignment/3.9.3/dragen-alignment__3.9.3.md)  


### custom-create-directory

#### Versions
  
- [1.0.0](.github/catalogue/docs/tools/custom-create-directory/1.0.0/custom-create-directory__1.0.0.md)  
- [2.0.0](.github/catalogue/docs/tools/custom-create-directory/2.0.0/custom-create-directory__2.0.0.md)  


### dragen-build-reference-tarball

#### Versions
  
- [3.7.5](.github/catalogue/docs/tools/dragen-build-reference-tarball/3.7.5/dragen-build-reference-tarball__3.7.5.md)  
- [3.8.4](.github/catalogue/docs/tools/dragen-build-reference-tarball/3.8.4/dragen-build-reference-tarball__3.8.4.md)  


### bgzip

#### Versions
  
- [1.12.0](.github/catalogue/docs/tools/bgzip/1.12.0/bgzip__1.12.0.md)  


### mosdepth

#### Versions
  
- [0.3.1](.github/catalogue/docs/tools/mosdepth/0.3.1/mosdepth__0.3.1.md)  


### custom-tso500-make-region-coverage-qc

#### Versions
  
- [1.0.0](.github/catalogue/docs/tools/custom-tso500-make-region-coverage-qc/1.0.0/custom-tso500-make-region-coverage-qc__1.0.0.md)  


### custom-tso500-make-exon-coverage-qc

#### Versions
  
- [1.0.0](.github/catalogue/docs/tools/custom-tso500-make-exon-coverage-qc/1.0.0/custom-tso500-make-exon-coverage-qc__1.0.0.md)  


### custom-tso500-align-collapse-fusion-caller-csv-metrics-to-json

#### Versions
  
- [1.0.0](.github/catalogue/docs/tools/custom-tso500-align-collapse-fusion-caller-csv-metrics-to-json/1.0.0/custom-tso500-align-collapse-fusion-caller-csv-metrics-to-json__1.0.0.md)  


### custom-tsv-to-json

#### Versions
  
- [1.0.0](.github/catalogue/docs/tools/custom-tsv-to-json/1.0.0/custom-tsv-to-json__1.0.0.md)  


### custom-tar-vcf-file-list

#### Versions
  
- [1.0.0](.github/catalogue/docs/tools/custom-tar-vcf-file-list/1.0.0/custom-tar-vcf-file-list__1.0.0.md)  


### custom-gzip-file

#### Versions
  
- [1.0.0](.github/catalogue/docs/tools/custom-gzip-file/1.0.0/custom-gzip-file__1.0.0.md)  


### custom-tar-file-list

#### Versions
  
- [1.0.0](.github/catalogue/docs/tools/custom-tar-file-list/1.0.0/custom-tar-file-list__1.0.0.md)  


### custom-create-umccrise-tsv

#### Versions
  
- [1.2.1--0](.github/catalogue/docs/tools/custom-create-umccrise-tsv/1.2.1--0/custom-create-umccrise-tsv__1.2.1--0.md)  
- [1.2.2--0](.github/catalogue/docs/tools/custom-create-umccrise-tsv/1.2.2--0/custom-create-umccrise-tsv__1.2.2--0.md)  


### umccrise

#### Versions
  
- [1.2.1--0](.github/catalogue/docs/tools/umccrise/1.2.1--0/umccrise__1.2.1--0.md)  
- [1.2.2--0](.github/catalogue/docs/tools/umccrise/1.2.2--0/umccrise__1.2.2--0.md)  
- [2.0.0--0](.github/catalogue/docs/tools/umccrise/2.0.0--0/umccrise__2.0.0--0.md)  


### custom-create-umccr-dragen-refdata-tarball-from-illumina-tar

#### Versions
  
- [1.0.0](.github/catalogue/docs/tools/custom-create-umccr-dragen-refdata-tarball-from-illumina-tar/1.0.0/custom-create-umccr-dragen-refdata-tarball-from-illumina-tar__1.0.0.md)  


### dragen-umi

#### Versions
  
- [3.8.4](.github/catalogue/docs/tools/dragen-umi/3.8.4/dragen-umi__3.8.4.md)  
- [3.9.3](.github/catalogue/docs/tools/dragen-umi/3.9.3/dragen-umi__3.9.3.md)  


### bcftools-view

#### Versions
  
- [1.13.0](.github/catalogue/docs/tools/bcftools-view/1.13.0/bcftools-view__1.13.0.md)  


### rnasum

#### Versions
  
- [0.4.1](.github/catalogue/docs/tools/rnasum/0.4.1/rnasum__0.4.1.md)  


## Workflows

### Workflows ToC
  
- [optitype-pipeline](#optitype-pipeline)  
- [get-hla-regions-bed](#get-hla-regions-bed)  
- [dragen-germline-pipeline](#dragen-germline-pipeline)  
- [dragen-qc-hla-pipeline](#dragen-qc-hla-pipeline)  
- [tso500-ctdna](#tso500-ctdna)  
- [bcl-conversion](#bcl-conversion)  
- [dragen-somatic-pipeline](#dragen-somatic-pipeline)  
- [dragen-transcriptome-pipeline](#dragen-transcriptome-pipeline)  
- [dragen-alignment-pipeline](#dragen-alignment-pipeline)  
- [dragen-wgs-qc-pipeline](#dragen-wgs-qc-pipeline)  
- [tso500-ctdna-post-processing-pipeline](#tso500-ctdna-post-processing-pipeline)  
- [umccrise-pipeline](#umccrise-pipeline)  
- [tso500-ctdna-with-post-processing-pipeline](#tso500-ctdna-with-post-processing-pipeline)  
- [umccrise-pipeline](#umccrise-pipeline)  
- [umccrise-with-dragen-germline-pipeline](#umccrise-with-dragen-germline-pipeline)  


### optitype-pipeline

#### Categories
  
- hla  


#### Versions
  
- [1.3.5](.github/catalogue/docs/workflows/optitype-pipeline/1.3.5/optitype-pipeline__1.3.5.md)  


### get-hla-regions-bed

#### Versions
  
- [1.0.0](.github/catalogue/docs/workflows/get-hla-regions-bed/1.0.0/get-hla-regions-bed__1.0.0.md)  


### dragen-germline-pipeline

#### Categories
  
- dragen  


#### Versions
  
- [3.7.5](.github/catalogue/docs/workflows/dragen-germline-pipeline/3.7.5/dragen-germline-pipeline__3.7.5.md)  
- [3.9.3](.github/catalogue/docs/workflows/dragen-germline-pipeline/3.9.3/dragen-germline-pipeline__3.9.3.md)  


### dragen-qc-hla-pipeline

#### Versions
  
- [3.7.5--1.3.5](.github/catalogue/docs/workflows/dragen-qc-hla-pipeline/3.7.5--1.3.5/dragen-qc-hla-pipeline__3.7.5--1.3.5.md)  


### tso500-ctdna

#### Categories
  
- tso500  


#### Versions
  
- [1.1.0--120](.github/catalogue/docs/workflows/tso500-ctdna/1.1.0--120/tso500-ctdna__1.1.0--120.md)  


### bcl-conversion

#### Versions
  
- [3.7.5](.github/catalogue/docs/workflows/bcl-conversion/3.7.5/bcl-conversion__3.7.5.md)  


### dragen-somatic-pipeline

#### Categories
  
- dragen  
- variant-calling  


#### Versions
  
- [3.7.5](.github/catalogue/docs/workflows/dragen-somatic-pipeline/3.7.5/dragen-somatic-pipeline__3.7.5.md)  
- [3.9.3](.github/catalogue/docs/workflows/dragen-somatic-pipeline/3.9.3/dragen-somatic-pipeline__3.9.3.md)  


### dragen-transcriptome-pipeline

#### Versions
  
- [3.7.5](.github/catalogue/docs/workflows/dragen-transcriptome-pipeline/3.7.5/dragen-transcriptome-pipeline__3.7.5.md)  
- [3.8.4](.github/catalogue/docs/workflows/dragen-transcriptome-pipeline/3.8.4/dragen-transcriptome-pipeline__3.8.4.md)  
- [3.9.3](.github/catalogue/docs/workflows/dragen-transcriptome-pipeline/3.9.3/dragen-transcriptome-pipeline__3.9.3.md)  


### dragen-alignment-pipeline

#### Categories
  
- alignment  
- dragen  


#### Versions
  
- [3.7.5](.github/catalogue/docs/workflows/dragen-alignment-pipeline/3.7.5/dragen-alignment-pipeline__3.7.5.md)  
- [3.9.3](.github/catalogue/docs/workflows/dragen-alignment-pipeline/3.9.3/dragen-alignment-pipeline__3.9.3.md)  


### dragen-wgs-qc-pipeline

#### Categories
  
- dragen  


#### Versions
  
- [3.7.5](.github/catalogue/docs/workflows/dragen-wgs-qc-pipeline/3.7.5/dragen-wgs-qc-pipeline__3.7.5.md)  
- [3.9.3](.github/catalogue/docs/workflows/dragen-wgs-qc-pipeline/3.9.3/dragen-wgs-qc-pipeline__3.9.3.md)  


### tso500-ctdna-post-processing-pipeline

#### Categories
  
- tso500  


#### Versions
  
- [1.0.0](.github/catalogue/docs/workflows/tso500-ctdna-post-processing-pipeline/1.0.0/tso500-ctdna-post-processing-pipeline__1.0.0.md)  


### umccrise-pipeline

#### Versions
  
- [1.2.1--0](.github/catalogue/docs/workflows/umccrise-pipeline/1.2.1--0/umccrise-pipeline__1.2.1--0.md)  
- [1.2.2--0](.github/catalogue/docs/workflows/umccrise-pipeline/1.2.2--0/umccrise-pipeline__1.2.2--0.md)  


### tso500-ctdna-with-post-processing-pipeline

#### Categories
  
- tso500  


#### Versions
  
- [1.1.0--1.0.0](.github/catalogue/docs/workflows/tso500-ctdna-with-post-processing-pipeline/1.1.0--1.0.0/tso500-ctdna-with-post-processing-pipeline__1.1.0--1.0.0.md)  


### umccrise-pipeline

#### Versions
  
- [1.2.1--0](.github/catalogue/docs/workflows/umccrise-pipeline/1.2.1--0/umccrise-pipeline__1.2.1--0.md)  
- [1.2.2--0](.github/catalogue/docs/workflows/umccrise-pipeline/1.2.2--0/umccrise-pipeline__1.2.2--0.md)  


### umccrise-with-dragen-germline-pipeline

#### Versions
  
- [2.0.0--3.9.3](.github/catalogue/docs/workflows/umccrise-with-dragen-germline-pipeline/2.0.0--3.9.3/umccrise-with-dragen-germline-pipeline__2.0.0--3.9.3.md)  

