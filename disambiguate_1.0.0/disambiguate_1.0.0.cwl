$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  foaf: 'http://xmlns.com/foaf/0.1/'
'dct:contributor':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:bolipatc@mskcc.org'
        'foaf:name': C. Allan Bolipata
    'foaf:name': Memorial Sloan Kettering Cancer Center
'dct:creator':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:bolipatc@mskcc.org'
        'foaf:name': C. Allan Bolipata
    'foaf:name': Memorial Sloan Kettering Cancer Center
'doap:release':
  - class: 'doap:Version'
    'doap:name': disambiguate
    'doap:revision': 1.0.0

class: CommandLineTool
cwlVersion: v1.0
baseCommand:
  - ngs_disambiguate
inputs:
  - id: no_sort
    type: string?
    inputBinding:
      position: 0
      prefix: '--no-sort'
  - id: prefix
    type: string
    inputBinding:
      position: 0
      prefix: '--prefix'
  - id: output_dir
    type: string
    inputBinding:
      position: 0
      prefix: '--output-dir'
  - id: aligner
    type: string?
    inputBinding:
      position: 0
      prefix: '--aligner'
    default: 'bwa'
  - id: species_a_bam
    type: File
    inputBinding:
      position: 1
  - id: species_b_bam
    type: File
    inputBinding:
      position: 2

outputs:
  - id: output
    type: Directory
    outputBinding:
      glob: '$(inputs.output_dir)'
requirements:
  - class: ResourceRequirement
    ramMin: 32000
    coresMin: 4
  - class: DockerRequirement
    dockerPull: 'mskcc/disambiguate:1.0.0'
  - class: InlineJavascriptRequirement
