#!/usr/bin/env cwl-runner
# originally from https://github.com/mskcc/pluto-cwl

cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  foaf: 'http://xmlns.com/foaf/0.1/'
  sbg: 'https://www.sevenbridges.com/'
class: ExpressionTool
# class: CommandLineTool
id: put-in-dir

inputs:
  output_directory_name: string
  files:
    type:
      type: array
      items:
        - File
        - Directory
        - string
        - 'null'

outputs:
  directory:
    type: Directory

# This tool returns a Directory object,
# which holds all output files from the list
# of supplied input files
expression: |
  ${
    var output_files = [];
    var input_files = inputs.files.filter(single_file => String(single_file).toUpperCase() != 'NONE');

    for (var i = 0; i < inputs.files.length; i++) {
      if(input_files[i]){
        output_files.push(inputs.files[i]);
      }
    }

    return {
      'directory': {
        'class': 'Directory',
        'basename': inputs.output_directory_name,
        'listing': output_files
      }
    };
  }

requirements:
  - class: ResourceRequirement
    ramMin: 2000
    coresMin: 1
  - class: InlineJavascriptRequirement
'dct:contributor':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:murphyc4@mskcc.org'
        'foaf:name': Charlie Murphy
    'foaf:name': Memorial Sloan Kettering Cancer Center
'dct:creator':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:murphyc4@mskcc.org'
        'foaf:name': Charlie Murphy
    'foaf:name': Memorial Sloan Kettering Cancer Center
