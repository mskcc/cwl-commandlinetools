class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  foaf: 'http://xmlns.com/foaf/0.1/'
  sbg: 'https://www.sevenbridges.com/'
id: bcftools_concat
baseCommand:
  - bcftools
  - concat
inputs:
  - id: output_name
    type: string
    inputBinding:
      position: 0
      prefix: '-o'
    doc: filename should contain .vcf.gz
  - 'sbg:toolDefaultValue': z
    id: output_type
    type: string?
    inputBinding:
      position: 84
      prefix: '-O'
  - id: input
    type: 'File[]'
    inputBinding:
      position: 100
outputs:
  - id: output_vcf
    type: File
    outputBinding:
      glob: |-
        ${
            if (inputs.prefix) {
              return inputs.prefix + '*.gz'
            } else {
              return '*.gz'
            }
        } 
label: access_merge
arguments:
  - position: 0
    prefix: ''
    valueFrom: '-a'
requirements:
  - class: ResourceRequirement
    ramMin: 8000
    coresMin: 1
  - class: DockerRequirement
    dockerPull: 'ghcr.io/msk-access/bcftools:1.15.1'
  - class: InlineJavascriptRequirement
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
    'doap:name': normvcf
    'doap:revision': 1.15.1
