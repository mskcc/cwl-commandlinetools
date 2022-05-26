class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  foaf: 'http://xmlns.com/foaf/0.1/'
  sbg: 'https://www.sevenbridges.com/'
id: tabix_1_3_1
baseCommand:
  - tabix
inputs:
  - default: vcf
    id: preset
    type: string?
    inputBinding:
      position: 0
      prefix: '-p'
    doc: 'gff, bed, sam, vcf'
  - id: file
    type: File
    inputBinding:
      position: 1
    doc: Input bgziped vcf file
outputs: []
label: tabix_1.3.1
requirements:
  - class: ResourceRequirement
    ramMin: 4000
    coresMin: 1
  - class: DockerRequirement
    dockerPull: 'ghcr.io/msk-access/tabix:1.3.1'
'dct:contributor':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:sivaprk@mskcc.org'
        'foaf:name': Karthigayini Sivaprakasam
    'foaf:name': Memorial Sloan Kettering Cancer Center
'dct:creator':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:sivaprk@mskcc.org'
        'foaf:name': Karthigayini Sivaprakasam
    'foaf:name': Memorial Sloan Kettering Cancer Center
'doap:release':
  - class: 'doap:Version'
    'doap:name': tabix
    'doap:revision': 1.3.1
