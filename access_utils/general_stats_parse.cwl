class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  foaf: 'http://xmlns.com/foaf/0.1/'
id: general_stats_parse
label: general_stats_parse
baseCommand: general_stats_parse.py
inputs:
  - id: dir
    type: Directory
    inputBinding:
      position: 0
      prefix: '--dir'
    doc: Directory containing results.
  - id: samples-json
    type: File
    inputBinding:
      position: 0
      prefix: '--samples-json'
    doc: Sample JSON file.
outputs:
  - id: sample_meta_tumor
    type: File?
    outputBinding:
      glob: genstats_qc_status_plasma.csv
  - id: sample_meta_normal
    type: File?
    outputBinding:
      glob: genstats_qc_status_buffy.csv
arguments: []
requirements:
  - class: DockerRequirement
    dockerPull: 'ghcr.io/msk-access/access_utils:0.1.0'
'dct:contributor':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:johnsoni@mskcc.org'
        'foaf:name': Ian Johnson
    'foaf:name': Memorial Sloan Kettering Cancer Center
'dct:creator':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:johnsoni@mskcc.org'
        'foaf:name': Ian Johnson
    'foaf:name': Memorial Sloan Kettering Cancer Center
