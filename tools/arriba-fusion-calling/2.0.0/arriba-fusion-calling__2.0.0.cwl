cwlVersion: v1.1
class: CommandLineTool

# Extensions
$namespaces:
    s: https://schema.org/
    ilmn-tes: http://platform.illumina.com/rdf/ica/
$schemas:
  - https://schema.org/version/latest/schemaorg-current-http.rdf

# Metadata
s:author:
    class: s:Person
    s:name: Sehrish Kanwal
    s:email: sehrish.kanwal@umccr.org

# ID/Docs
id: arriba-fusion-calling--2.0.0
label: arriba-fusion-calling v(2.0.0)
doc: |
    Documentation for arriba-fusion-calling v2.0.0

hints:
  ResourceRequirement:
    ilmn-tes:resources:
      type: standardHiCpu
      size: large
  DockerRequirement:
    dockerPull: "uhrigs/arriba:2.0.0"
    dockerOutputDirectory: /output

requirements:
  InlineJavascriptRequirement: {}

baseCommand: ["/arriba_v2.0.0/arriba"]

inputs:
  bam_file:
    label: bam file
    doc: |
      File in SAM/BAM/CRAM format with main alignments as generated by STAR
    type: File
    secondaryFiles: 
      - .bai
    inputBinding:
      prefix: -x
      position: 1
  annotation:
    label: annotation
    doc: |
      GTF file with gene annotation. The file may be gzip-compressed
    type: File
    inputBinding:
      prefix: -g
      position: 2
  reference:
    label: reference
    doc: |
      FastA file with genome sequence (assembly). The file may be gzip-compressed
    type: File
    inputBinding:
      prefix: -a
      position: 3
  contigs:
    label: contigs
    doc: |
      Comma-/space-separated list of interesting contigs. Fusions between genes on other contigs are ignored
    type: string?
    default: 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,X,Y
    inputBinding:
      prefix: -i
      position: 4
  blacklist:
    label: blacklist
    doc: |
      File containing blacklisted ranges
    type: File
    inputBinding:
      prefix: -b
      position: 5
  fusion:
    label: fusion
    doc: |
      Output file with fusions that have passed all filters
    type: string?
    default: fusion-passed.tsv
    inputBinding:
      prefix: -o
      position: 6
  discardedFusion:
    label: discarded fusion
    doc: |
      Output file with fusions that were discarded due to filtering
    type: string?
    default: fusion-discarded.tsv
    inputBinding:
      prefix: -O
      position: 7


outputs:
  fusions:
    label: fusions
    doc: |
      file with output fusions
    type: File
    outputBinding: 
      glob: "$(inputs.fusion)"
  discardedFusions:
    label: discarded fusions
    doc: | 
      file with discarded fusions
    type: File
    outputBinding: 
      glob: "$(inputs.discardedFusion)"

successCodes:
  - 0
