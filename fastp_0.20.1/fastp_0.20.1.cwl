class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  foaf: 'http://xmlns.com/foaf/0.1/'
  sbg: 'https://www.sevenbridges.com/'
id: fastp_0_20_1
baseCommand:
  - fastp
inputs:
  - id: read1_input
    type: File
    inputBinding:
      position: 0
      prefix: '--in1'
    doc: |
      read1 input file name
  - id: read1_output_path
    type: string
    inputBinding:
      position: 0
      prefix: '--out1'
    doc: |
      read1 output file name
  - id: read2_input
    type: File?
    inputBinding:
      position: 0
      prefix: '--in2'
    doc: |
      read2 input file name, for PE data
  - id: read2_output_path
    type: string?
    inputBinding:
      position: 0
      prefix: '--out2'
    doc: |
      read2 output file name
  - id: unpaired1_path
    type: string?
    inputBinding:
      position: 0
      prefix: '--unpaired1'
    doc: >
      for PE input, if read1 passed QC but read2 not, it will be written to
      unpaired1. 
  - id: unpaired2_path
    type: string?
    inputBinding:
      position: 0
      prefix: '--unpaired2'
    doc: >
      for PE input, if read2 passed QC but read1 not, it will be written to
      unpaired2.
  - id: failed_reads_path
    type: string?
    inputBinding:
      position: 0
      prefix: '--failed_out'
    doc: |
      specify the file to store reads that cannot pass the filters.
  - id: read1_adapter_sequence
    type: string?
    inputBinding:
      position: 0
      prefix: '--adapter_sequence'
    doc: >
      the adapter for read1. For SE data, if not specified, the adapter will be
      auto-detected. For PE data, this is used if R1/R2 are found not
      overlapped.
  - id: read2_adapter_sequence
    type: string?
    inputBinding:
      position: 0
      prefix: '--adapter_sequence_r2'
    doc: >
      the adapter for read2. For PE data, this is used if R1/R2 are found not
      overlapped.
  - id: minimum_read_length
    type: int?
    inputBinding:
      position: 0
      prefix: '--length_required'
    doc: |
      reads shorter than length_required will be discarded, default is 15.
  - default: fastp.json
    id: json_output_path
    type: string
    inputBinding:
      position: 0
      prefix: '--json'
    doc: |
      the json format report file name
  - default: fastp.html
    id: html_output_path
    type: string
    inputBinding:
      position: 0
      prefix: '--html'
    doc: |
      the html format report file name
outputs:
  - id: fastp_json_output
    type: File
    outputBinding:
      glob: $(inputs.json_output_path)
  - id: fastp_html_output
    type: File
    outputBinding:
      glob: $(inputs.html_output_path)
  - id: fastp_read1_output
    type: File
    outputBinding:
      glob: $(inputs.read1_output_path)
  - id: fastp_read2_output
    type: File?
    outputBinding:
      glob: $(inputs.read2_output_path)
  - id: fastp_unpaired1_output
    type: File?
    outputBinding:
      glob: $(inputs.unpaired1_path)
  - id: fastp_unpaired2_output
    type: File?
    outputBinding:
      glob: $(inputs.unpaired2_path)
doc: Setup and execute Fastp
label: fastp_0.20.1
requirements:
  - class: ResourceRequirement
    ramMin: 16000
    coresMin: 2
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/fastp:0.20.1--h8b12597_0'
  - class: InlineJavascriptRequirement
'dct:contributor':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:murphyc4@mskcc.org'
        'foaf:name': Charlie Murphy
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:fraihaa@mskcc.org'
        'foaf:name': Adrian Fraiha
    'foaf:name': Memorial Sloan Kettering Cancer Center
'dct:creator':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:shahr2@mskcc.org'
        'foaf:name': Ronak Shah
    'foaf:name': Memorial Sloan Kettering Cancer Center
'doap:release':
  - class: 'doap:Version'
    'doap:name': fastp
    'doap:revision': 0.20.1
