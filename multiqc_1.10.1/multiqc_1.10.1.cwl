class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - multiqc
inputs:
  - id: qc_files_dir
    type: Directory?
    inputBinding:
      position: 999
    doc: |
      qc files in a Directory
  - default: multiqc_1.10.1
    id: report_name
    type: string
    inputBinding:
      position: 0
      prefix: '--filename'
    doc: name used for the html report and the corresponding zip file
  - id: config
    type: File?
    inputBinding:
      position: 0
      prefix: '--config'
outputs:
  - id: diree
    type: Directory
    outputBinding:
      glob: .
  - id: multiqc_html
    type: File
    outputBinding:
      glob: $(inputs.report_name).html
  - id: multiqc_zip
    type: File?
    outputBinding:
      glob: $(inputs.report_name)_data.zip
doc: |
  Run multiqc on log files from supported bioinformatic tools.
hints:
  - class: ResourceRequirement
    ramMin: 10000
    coresMin: 1
  - class: DockerRequirement
    dockerPull: 'ghcr.io/msk-access/multiqc:v1.10.1.3'
requirements:
  - class: InlineJavascriptRequirement
