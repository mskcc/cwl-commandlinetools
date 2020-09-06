class: CommandLineTool
cwlVersion: v1.0
id: scatterintervals
baseCommand:
  - gatk
  - SplitIntervals
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
  - id: scatter-count
    type: int?
    inputBinding:
      position: 0
      prefix: '--scatter-count'
  - id: output
    type: string
    inputBinding:
      position: 0
      prefix: '--output'
outputs:
  - id: gatk_scatter_intervals_interval_files
    type: 'File[]'
    outputBinding:
      glob: $(inputs.output)/*.interval_list
label: ScatterIntervals
arguments:
  - position: 0
    prefix: '--subdivision-mode'
    valueFrom: BALANCING_WITHOUT_INTERVAL_SUBDIVISION_WITH_OVERFLOW
requirements:
  - class: DockerRequirement
    dockerPull: 'broadinstitute/gatk:4.1.0.0'
  - class: InlineJavascriptRequirement
