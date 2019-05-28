class: Workflow
cwlVersion: v1.0
id: bwa_sort_merge
label: bwa_sort_merge

inputs:
  - id: reference_sequence
    type: File
    secondaryFiles:
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa
      - .fai
  - id: read_pair
    type:
      type: array
      items:
        items: File
        type: array
  - id: sample_id
    type: string
  - id: lane_id
    type: 'string[]'

outputs:
  - id: sample_id_output
    outputSource:
      - bwa_sort/sample_id_output
    type:
      - string
      - type: array
        items: string
  - id: output_md_metrics
    outputSource:
      - gatk_markduplicatesgatk/output_md_metrics
    type: File
  - id: output_md_bam
    outputSource:
      - gatk_markduplicatesgatk/output_md_bam
    type: File

steps:
  - id: samtools_merge
    in:
      - id: input_bams
        source:
          - bwa_sort/output_file
    out:
      - id: output_file
    run: ../CommandLineTools/samtools-merge_1.9/samtools-merge_1.9.cwl
  - id: bwa_sort
    in:
      - id: reference_sequence
        source: reference_sequence
      - id: read_pair
        source:
          - read_pair
      - id: sample_id
        source: sample_id
      - id: lane_id
        source: lane_id
    out:
      - id: output_file
      - id: sample_id_output
      - id: lane_id_output
    run: ./bwa_sort.cwl
    label: bwa_sort
    scatter:
      - read_pair
      - lane_id
    scatterMethod: dotproduct
  - id: gatk_markduplicatesgatk
    in:
      - id: input_bam
        source: samtools_merge/output_file
    out:
      - id: output_md_bam
      - id: output_md_metrics
    run: ../CommandLineTools/mark-duplicates_4.1.0.0/mark-duplicates_4.1.0.0.cwl
    label: GATK MarkDuplicates

requirements:
  - class: SubworkflowFeatureRequirement
  - class: ScatterFeatureRequirement
