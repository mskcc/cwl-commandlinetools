class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  foaf: 'http://xmlns.com/foaf/0.1/'
  sbg: 'https://www.sevenbridges.com/'
id: sortbed
baseCommand:
  - sortBed
inputs:
  - id: input
    type: File
    inputBinding:
      position: 0
      prefix: '-i'
    doc: input file
  - id: output_file_name
    type: string?
    doc: Name of the output file
outputs:
  - id: sorted_file
    type: File?
    outputBinding:
      glob: |-
        ${
            if(inputs.output_file_name) {
                return inputs.output_file_name
            } else {
                return inputs.input.basename + '.sorted'
            } 
        }
label: sortBed
requirements:
  - class: ResourceRequirement
    ramMin: 2000
    coresMin: 1
  - class: DockerRequirement
    dockerPull: 'ghcr.io/msk-access/bedtools:v2.28.0_cv2'
  - class: InlineJavascriptRequirement
stdout: >-
        ${
            if(inputs.output_file_name) {
                return inputs.output_file_name
            } else {
                return inputs.input.basename + '.sorted'
            } 
        }
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
    'doap:name': sortbed
    'doap:revision': 2.28.0
