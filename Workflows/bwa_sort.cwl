class: Workflow
cwlVersion: v1.0
id: bwa_sort
label: bwa_sort
$namespaces:
  foaf: http://xmlns.com/foaf/0.1/
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
    type: 'File[]'

  - id: sample_id
    type: string

  - id: lane_id
    type: string

outputs:
  - id: output_file
    outputSource:
      - samtools_sort/output_file
    type: File

  - id: sample_id_output
    outputSource:
      - sample_id
    type: string

  - id: lane_id_output
    outputSource:
      - lane_id
    type: string

steps:
  - id: bwa_mem
    in:
      - id: read_pair
        source:
          - read_pair
      - id: reference_sequence
        source: reference_sequence
      - id: sample_id
        source: sample_id
      - id: lane_id
        source: lane_id
    out:
      - id: output_sam
    run: ../CommandLineTools/bwa_0.7.12/bwa-mem_0.7.12.cwl

  - id: samtools_sort
    in:
      - id: input
        source: sam_to_bam/output_bam
    out:
      - id: output_file
    run: ../CommandLineTools/samtools-sort_1.3.1/samtools-sort_1.3.1.cwl

  - id: sam_to_bam
    in:
      - id: input
        source: bwa_mem/output_sam
    out:
      - id: output_bam
    run: ../CommandLineTools/sam-to-bam_1.3.1/sam-to-bam_1.3.1.cwl

requirements: []
