class: CommandLineTool
cwlVersion: v1.0

id: gatk__apply_b_q_s_r
baseCommand:
  - gatk
  - ApplyBQSR
inputs:
  - id: input_file
    type: File
    inputBinding:
      position: 1
      prefix: '-I'
    doc: Input file containing sequence data (SAM or BAM)
  - id: number_of_threads
    type: int?
    inputBinding:
      position: 0
      prefix: '-nt'
  - id: recalibration_table
    type: File
    inputBinding:
      position: 3
      prefix: '-bqsr'
    doc: >-
      Input recalibration table for BQSR. Only run ApplyBQSR with the covariates
      table created from the input BAM
  - id: use_original_quality
    type: boolean
    inputBinding:
      position: 4
      prefix: '-OQ'
    doc: Use the base quality scores from the OQ tag
  - id: reference_sequence
    type: File
    inputBinding:
      position: 1
      prefix: '-R'
    doc: Reference sequence
outputs:
  - id: output_file
    doc: Write output to this file
    type: File
    outputBinding:
      glob: '*bam'
    secondaryFiles:
      - '*.bai'
label: gatk_print_reads
requirements:
  - class: ResourceRequirement
    coresMin: "${\r  if (inputs.number_of_threads) {\r    \r   \treturn inputs.number_of_threads \r  }\r  else {\r    \r    return 1\r  }\r}"
  - class: DockerRequirement
    dockerPull: 'broadinstitute/gatk:4.1.2.0'
  - class: InlineJavascriptRequirement
