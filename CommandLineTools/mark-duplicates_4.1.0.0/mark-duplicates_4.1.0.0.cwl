class: CommandLineTool
cwlVersion: v1.0
id: gatk_markduplicatesgatk
baseCommand:
  - gatk
  - MarkDuplicates
inputs:
  - id: input_bam
    type: File
    inputBinding:
      position: 0
      prefix: '--INPUT'
    doc: Input BAM file
  - default: '-Xms4000m -Xmx7g'
    id: java_opts
    type: string?
    inputBinding:
      position: 0
      prefix: '--java-options'
outputs:
  - id: output_md_bam
    doc: Output marked duplicate bam
    type: File
    outputBinding:
      glob: '$(inputs.input_bam.basename.replace(''md.bam'', ''bam''))'
    secondaryFiles:
      - ^.bai
  - id: output_md_metrics
    doc: Output marked duplicate metrics
    type: File
    outputBinding:
      glob: '$(inputs.input_bam.basename.replace(''bam'', ''md.metrics''))'
label: GATK MarkDuplicates
arguments:
  - position: 0
    prefix: '--OUTPUT'
    valueFrom: '$(inputs.input_bam.basename.replace(''md.bam'', ''bam''))'
  - position: 0
    prefix: '--METRICS_FILE'
    valueFrom: '$(inputs.input_bam.basename.replace(''bam'', ''md.metrics''))'
  - position: 0
    prefix: '--TMP_DIR'
    valueFrom: .
  - position: 0
    prefix: '--ASSUME_SORT_ORDER'
    valueFrom: coordinate
  - position: 0
  - position: 0
    prefix: '--CREATE_INDEX'
    valueFrom: 'true'
  - position: 0
    prefix: '--MAX_RECORDS_IN_RAM'
    valueFrom: '50000'
requirements:
  - class: ResourceRequirement
    ramMin: 32000
    coresMin: 4
  - class: DockerRequirement
    dockerPull: 'broadinstitute/gatk:4.1.0.0'
  - class: InlineJavascriptRequirement
