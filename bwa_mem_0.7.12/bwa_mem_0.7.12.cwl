class: CommandLineTool
cwlVersion: v1.0
baseCommand:
  - bwa
  - mem
  - '-M'
inputs:
  - id: read_pair
    type: 'File[]'
    inputBinding:
      position: 3
  - id: reference_sequence
    type: File
    inputBinding:
      position: 2
    secondaryFiles:
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa
      - .fai
  - id: threads
    type: int?
    inputBinding:
      position: 0
      prefix: '-t'
  - id: sample_id
    type: string
  - id: lane_id
    type: string
outputs:
  - id: output_sam
    type: File
    outputBinding:
      glob: '$(inputs.read_pair[0].basename.replace(''fastq.gz'', ''sam''))'
arguments:
  - position: 0
    prefix: '-R'
    valueFrom: >-
      @RG\\tID:$(inputs.lane_id)\\tSM:$(inputs.sample_id)\\tLB:$(inputs.sample_id)\\tPL:Illumina
requirements:
  - class: ResourceRequirement
    ramMin: 32000
    coresMin: 4
  - class: DockerRequirement
    dockerPull: 'quay.io/collaboratory/dockstore-tool-bwa-mem:1.0'
  - class: InlineJavascriptRequirement
stdout: '$(inputs.read_pair[0].basename.replace(''fastq.gz'', ''sam''))'
