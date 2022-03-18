#!/usr/bin/env cwl-runner
cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  foaf: 'http://xmlns.com/foaf/0.1/'
  sbg: 'https://www.sevenbridges.com/'
class: Workflow
id: vardict
label: vardict
requirements:
    MultipleInputFeatureRequirement: {}
    ScatterFeatureRequirement: {}
    SubworkflowFeatureRequirement: {}
    InlineJavascriptRequirement: {}
    StepInputExpressionRequirement: {}
inputs:
  bedfile:
    type: File?

  G:
    type: File
    secondaryFiles: ['.fai']
  f:
    type: string?
  N:
    type: string?
  b:
    type: File?
    secondaryFiles: ['.bai']
  c:
    type: string?
  S:
    type: string?
  E:
    type: string?
  g:
    type: string?
  vcf:
    type: string?
  f_1:
    type: string?

outputs:
  output:
    type: File
    outputSource: var_to_vcf/output
steps:
  vardict:
    run: ./vardict_app.cwl
    in:
      G: G
      f: f
      N: N
      S: S
      c: c
      b: b
      bedfile: bedfile
      E: E
      g: g
    out: [output]
  teststrandbias:
    run: ./teststrandbias.cwl
    in:
      input_vardict: vardict/output
    out: [output_var]
  var_to_vcf:
    run: ./var_to_vcf.cwl
    in:
      N: N
      f: f_1
      vcf: vcf
      input_vcf: teststrandbias/output_var
    out: [output]

'dct:contributor':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:vurals@mskcc.org'
        'foaf:name': Suleyman Vural
    'foaf:name': Memorial Sloan Kettering Cancer Center
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:kumarn1@mskcc.org'
        'foaf:name': Nikhil Kumar
    'foaf:name': Memorial Sloan Kettering Cancer Center
'dct:creator':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:kumarn1@mskcc.org'
        'foaf:name': Nikhil Kumar
    'foaf:name': Memorial Sloan Kettering Cancer Center
'doap:release':
  - class: 'doap:Version'
    'doap:name': Vardictjava
    'doap:revision': 1.8.2
