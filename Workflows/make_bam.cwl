class: Workflow
cwlVersion: v1.0
id: make_bam
label: make_bam

inputs:
  - id: read_pairs_normal
    type:
      type: array
      items:
        items: File
        type: array
  - id: lane_ids_normal
    type: 'string[]'
  - id: reference_sequence
    type: File
    secondaryFiles:
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa
      - .fai
  - id: sample_id_normal
    type: string
  - id: sample_id_tumor
    type: string
  - id: read_pairs_tumor
    type:
      type: array
      items:
        items: File
        type: array
  - id: lane_ids_tumor
    type: 'string[]'

outputs:
  - id: sample_id_output_normal
    outputSource:
      - make_bam_Normal/sample_id_output
    type:
      - string
      - type: array
        items: string
  - id: normal_bam
    outputSource:
      - make_bam_Normal/output_md_bam
    type: File
  - id: sample_id_output_tumor
    outputSource:
      - make_bam_Tumor/sample_id_output
    type:
      - string
      - type: array
        items: string
  - id: tumor_bam
    outputSource:
      - make_bam_Tumor/output_md_bam
    type: File
  - id: tumor_metrics
    outputSource:
      - make_bam_Tumor/output_md_metrics
    type: File
  - id: normal_metrics
    outputSource:
      - make_bam_Normal/output_md_metrics
    type: File

steps:
  - id: make_bam_Normal
    in:
      - id: reference_sequence
        source: reference_sequence
      - id: read_pair
        source:
          - read_pairs_normal
      - id: sample_id
        source: sample_id_normal
      - id: lane_id
        source:
          - lane_ids_normal
    out:
      - id: sample_id_output
      - id: output_md_metrics
      - id: output_md_bam
    run: ./bwa_sort_merge.cwl
    label: make_bam_Normal
  - id: make_bam_Tumor
    in:
      - id: reference_sequence
        source: reference_sequence
      - id: read_pair
        source:
          - read_pairs_tumor
      - id: sample_id
        source: sample_id_tumor
      - id: lane_id
        source:
          - lane_ids_tumor
    out:
      - id: sample_id_output
      - id: output_md_metrics
      - id: output_md_bam
    run: ./bwa_sort_merge.cwl
    label: make_bam_Tumor
requirements:
  - class: SubworkflowFeatureRequirement
