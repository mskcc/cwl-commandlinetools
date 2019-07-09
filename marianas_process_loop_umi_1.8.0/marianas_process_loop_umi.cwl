class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
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
      outputEval: |-
        ${
            self[0].basename = inputs.add_rg_SM + '_R1.fastq.gz';
            return self[0]
        }
  - id: processed_fastq_2
    type: File
    outputBinding:
      glob: '$(inputs.fastq2.basename.replace(''.fastq'', ''_umi-clipped.fastq''))'
      outputEval: |-
        ${
            self[0].basename = inputs.add_rg_SM + '_R2.fastq.gz';
            return self[0]
        }
  - id: clipping_info
    type: File
    outputBinding:
      glob: info.txt
      outputEval: |-
        ${
            self[0].basename = inputs.add_rg_SM + '_info.txt';
            return self[0]
        }
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
  - position: 3
    prefix: ''
    separate: false
    valueFrom: .
requirements:
  - class: ResourceRequirement
    ramMin: 10000
    coresMin: 1
  - class: DockerRequirement
    dockerPull: 'mskcc/marianas:0.1.0'
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.fastq1)
      - $(inputs.fastq2)
      - $(inputs.sample_sheet)
  - class: InlineJavascriptRequirement
