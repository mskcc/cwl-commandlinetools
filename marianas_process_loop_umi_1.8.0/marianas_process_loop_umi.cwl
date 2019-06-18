class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: marianas_process_loop_umi_cwl
baseCommand:
  - java8
inputs:
  - id: fastq1
    type: File?
    inputBinding:
      position: 1
  - id: fastq2
    type: File?
  - id: sample_sheet
    type: File?
  - id: umi_length
    type: int?
    inputBinding:
      position: 2
  - id: input
    type: File?
  - id: output_project_folder
    type: Directory?
    inputBinding:
      position: 3
  - id: add_rg_SM
    type: string?
outputs:
  - id: processed_fastq_1
    type: File?
    outputBinding:
      glob: $('*/' + inputs.fastq1.basename)
      outputEval: |-
        ${
            self[0].basename = inputs.add_rg_SM + '_R1.fastq.gz';
            return self[0]
        }
  - id: processed_fastq_2
    type: File?
    outputBinding:
      glob: '$(''*/'' + inputs.fastq2.basename.replace(''_R1_'', ''_R2_''))'
      outputEval: |-
        ${
            self[0].basename = inputs.add_rg_SM + '_R2.fastq.gz';
            return self[0]
        }
  - id: clipping_info
    type: File?
    outputBinding:
      glob: '*/info.txt'
      outputEval: |-
        ${
            self[0].basename = inputs.add_rg_SM + '_info.txt';
            return self[0]
        }
  - id: clipping_dir
    type: Directory?
    outputBinding:
      glob: '*/'
      outputEval: |-
        ${
            self[0].basename = inputs.add_rg_SM + '_umi_clipping_results';
            return self[0]
        }
label: marianas_process_loop_umi.cwl
arguments:
  - position: 0
    prefix: ''
    valueFrom: '-server'
  - position: 0
    prefix: ''
    valueFrom: '-Xms$(parseInt(runtime.ram)/100 - 2)g -Xmx$(parseInt(runtime.ram)/100 - 2)g'
  - position: 0
    prefix: ''
    valueFrom: '-cp'
  - position: 0
    prefix: '-jar'
    valueFrom: /bin/marianas.jar
  - position: 0
    prefix: ''
    valueFrom: org.mskcc.marianas.umi.duplex.fastqprocessing.ProcessLoopUMIFastq
requirements:
  - class: ResourceRequirement
    ramMin: 10000
    coresMin: 1
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.fastq1)
      - $(inputs.fastq2)
      - $(inputs.sample_sheet)
  - class: InlineJavascriptRequirement
