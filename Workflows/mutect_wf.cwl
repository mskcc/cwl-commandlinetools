class: Workflow
cwlVersion: v1.0
id: mutect_wf
label: mutect_wf
inputs:
  - id: scatter-count
    type: int?
  - id: output
    type: string
  - id: intervals
    type: File?
  - id: reference
    type: File?
  - id: tumor_sample
    type: string?
  - id: normal_sample
    type: string?
  - id: input_normal
    type: File?
  - id: input_tumor
    type: File?

outputs:
  - id: output_1
    outputSource:
      - mutect2/output
    type: 'File[]?'

steps:
  - id: scatterintervals
    in:
      - id: reference
        source: reference
      - id: intervals
        source: intervals
      - id: scatter-count
        source: scatter-count
      - id: output
        source: output
    out:
      - id: interval_files
    run: ../CommandLineTools/scatterintervals_4.1.0.0/scatterintervals_4.1.0.0.cwl 
    label: ScatterIntervals
  - id: mutect2
    in:
      - id: reference
        source: reference
      - id: intervals
        source: scatterintervals/interval_files
      - id: input
        source: input_tumor
      - id: tumor_sample
        source: tumor_sample
      - id: input_normal
        source: input_normal
      - id: normal_sample
        source: normal_sample
    out:
      - id: output
    run: ../CommandLineTools/mutect2_4.1.0.0/mutect2_4.1.0.0.cwl 
    label: Mutect2
    scatter:
      - intervals
requirements:
  - class: ScatterFeatureRequirement
