class: CommandLineTool
cwlVersion: v1.0
id: alfred_0_1_17
baseCommand:
  - alfred
  - qc
inputs:
  - id: reference
    type: File
    inputBinding:
      position: 0
      prefix: '--reference'
  - id: ignore_rg
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--ignore'
  - id: bed
    type: File?
    inputBinding:
      position: 0
      prefix: '--bed'
  - id: bam
    type: File
    inputBinding:
      position: 3
    secondaryFiles:
      - .bai
  - id: read_group
    type: string?
    inputBinding:
      position: 0
      prefix: '--rg'
  - id: supplementary
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--supplementary'
  - id: secondary
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--secondary'
  - id: jsonout
    type: string?
    inputBinding:
      position: 0
      prefix: '--jsonout'
  - id: sample_name
    type: string?
    inputBinding:
      position: 0
      prefix: '--name'
  - id: outfile
    type: string?
outputs:
  - id: output
    type: File?
    outputBinding:
      glob: '*.pdf'
  - id: output_pdf
    type: File?
    outputBinding:
      glob: '*.tsv.gz'
label: alfred_0.1.17
arguments:
  - position: 4
    prefix: ''
    shellQuote: false
    valueFrom: '&&'
  - position: 5
    prefix: ''
    shellQuote: false
    valueFrom: Rscript
  - position: 6
    prefix: ''
    shellQuote: false
    valueFrom: /opt/alfred/scripts/stats.R
  - position: 7
    prefix: ''
    shellQuote: false
    valueFrom: |-
      ${
          if (inputs.outname) {
              return inputs.outname + '.tsv.gz';
          }
          if (inputs.ignore_rg) {
              return inputs.bam.basename.replace('.bam', '') + '.alfred.tsv.gz'
          }
          return inputs.bam.basename.replace('.bam', '') + 'RG.alfred.tsv.gz'
      }
  - position: 2
    prefix: '--outfile'
    shellQuote: false
    valueFrom: |-
      ${
          if (inputs.outname) {
              return inputs.outname + '.tsv.gz';
          }
          if (inputs.ignore_rg) {
              return inputs.bam.basename.replace('.bam', '') + '.alfred.tsv.gz';
          }
          return inputs.bam.basename.replace('.bam', '') + 'RG.alfred.tsv.gz';
      }
requirements:
  - class: ShellCommandRequirement
  - class: DockerRequirement
    dockerPull: 'cmopipeline/alfred:v0.1.17'
  - class: InlineJavascriptRequirement
