class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  foaf: 'http://xmlns.com/foaf/0.1/'
  sbg: 'https://www.sevenbridges.com/'
id: tabix
baseCommand:
  - bgzip
inputs:
  - id: input
    type: File
    inputBinding:
      position: 0
    doc: input VCF file
outputs:
  - id: zippedVcf
    type: File?
    outputBinding:
      glob: >-
        ${     if(inputs.output_file_name){         return
        inputs.output_file_name     } else {         return
        inputs.input.basename.replace(/.vcf/,'.vcf.gz')     } }
label: tabix
arguments:
  - position: 0
    prefix: ''
    valueFrom: '-c'
requirements:
  - class: ResourceRequirement
    ramMin: 8000
    coresMin: 1
  - class: DockerRequirement
    dockerPull: 'ghcr.io/msk-access/bcftools:1.15.1'
  - class: InlineJavascriptRequirement
stdout: >-
  ${     if (inputs.output_file_name)       return inputs.output_file_name;    
  return inputs.input.basename.replace('.vcf','.vcf.gz');   }
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
    'doap:name': bcftools
    'doap:revision': 1.15.1
