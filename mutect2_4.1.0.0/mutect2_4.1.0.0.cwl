class: CommandLineTool
cwlVersion: v1.0
id: mutect2
baseCommand:
  - gatk
  - '--java-options'
  - '-Xmx8g'
  - Mutect2
inputs:
  - id: reference
    type: File?
    inputBinding:
      position: 0
      prefix: '--reference'
  - id: intervals
    type: File?
    inputBinding:
      position: 0
      prefix: '--intervals'
  - id: input
    type: File?
    inputBinding:
      position: 1
      prefix: '--input'
    secondaryFiles:
      - ^.bai
  - id: tumor_sample
    type: string?
    inputBinding:
      position: 2
      prefix: '--tumor-sample'
  - id: input_normal
    type: File?
    inputBinding:
      position: 3
      prefix: '--input'
    secondaryFiles:
      - ^.bai
  - id: normal_sample
    type: string?
    inputBinding:
      position: 4
      prefix: '--normal-sample'
outputs:
  - id: mutect2_vcf_gz
    type: File?
    outputBinding:
      glob: >-
        $(inputs.tumor_sample)_vs_$(inputs.normal_sample)_$(inputs.intervals.basename).vcf.gz
label: Mutect2
arguments:
  - position: 5
    prefix: '--output'
    valueFrom: >-
      $(inputs.tumor_sample)_vs_$(inputs.normal_sample)_$(inputs.intervals.basename).vcf.gz
requirements:
  - class: DockerRequirement
    dockerPull: 'broadinstitute/gatk:4.1.0.0'
  - class: InlineJavascriptRequirement
