class: CommandLineTool
cwlVersion: v1.0
id: marianas_process_loop_umi_cwl
baseCommand:
  - java
inputs:
  - id: fastq1
    type: File?
    inputBinding:
      position: 1
  - id: fastq2
    type: File?
    inputBinding:
      position: 2
  - id: umi_length
    type: int?
    inputBinding:
      position: 3
outputs:
  - id: processed_fastq_1
    type: File
    outputBinding:
      glob: '$(inputs.fastq1.basename.replace(''.fastq'', ''_umi-clipped.fastq''))'
  - id: processed_fastq_2
    type: File
    outputBinding:
      glob: '$(inputs.fastq2.basename.replace(''.fastq'', ''_umi-clipped.fastq''))'
  - id: clipping_info
    type: File
    outputBinding:
      glob: info.txt
  - id: composite_umi_frequencies
    type: File
    outputBinding:
      glob: composite-umi-frequencies.txt
label: marianas_process_loop_umi.cwl
arguments:
  - position: 0
    prefix: ''
    separate: false
    valueFrom: '-server'
  - position: 0
    prefix: ''
    separate: false
    valueFrom: '-Xms$(parseInt(runtime.ram)/1000 - 2)g'
  - position: 0
    prefix: ''
    separate: false
    valueFrom: '-Xmx$(parseInt(runtime.ram)/1000 - 2)g'
  - position: 0
    prefix: ''
    separate: false
    valueFrom: '-cp'
  - position: 0
    prefix: ''
    separate: false
    valueFrom: /usr/bin/Marianas-1.8.1.jar
  - position: 0
    prefix: ''
    separate: false
    valueFrom: org.mskcc.marianas.umi.duplex.fastqprocessing.ProcessLoopUMIFastq
requirements:
  - class: ResourceRequirement
    ramMin: 10000
    coresMin: 1
  - class: DockerRequirement
    dockerPull: 'mskcc/marianas:0.1.0'
  - class: InlineJavascriptRequirement
