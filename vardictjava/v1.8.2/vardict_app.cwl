#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand:
- /usr/bin/vardict/bin/VarDict
id: vardict

arguments:
- position: 1
  prefix: -b
  valueFrom: "${\n    return inputs.b.path;\n}"
# - position: 0
#   prefix: -N
#   valueFrom: "${\n    if (inputs.N2)\n        return [inputs.N, inputs.N2];\n    else\n\
#     \        return inputs.N;\n}"


requirements:
  EnvVarRequirement:
      envDef:
        JAVA_OPTS: '"-Xms8g" "-Xmx95g"'
  InlineJavascriptRequirement: {}
  ResourceRequirement:
    coresMin: 4
    ramMin: 64000
  DockerRequirement:
    dockerPull: ghcr.io/msk-access/vardictjava:1.8.2

inputs:
  G:
    type: File
    doc: The reference fasta. Should be indexed (.fai)
    secondaryFiles:
      - .fai
    inputBinding:
      position: 0
      prefix: -G

  f:
    type: string?
    doc: The threshold for allele frequency, default - 0.01 or 1%%
    inputBinding:
      position: 0
      prefix: -f

  N:
    type: string?
    doc: Tumor Sample Name

  b:
    type: File?
    secondaryFiles:
      - .bai
    doc: Tumor bam

  c:
    type: string?
    doc: The column for chromosome
    inputBinding:
      position: 0
      prefix: -c

  S:
    type: string?
    doc: The column for region start, e.g. gene start
    inputBinding:
      position: 0
      prefix: -S

  E:
    type: string?
    doc: The column for region end, e.g. gene end
    inputBinding:
      position: 0
      prefix: -E

  g:
    type: string?
    doc: The column for gene name, or segment annotation
    inputBinding:
      position: 0
      prefix: -g

  bedfile:
    type: File?
    inputBinding:
      position: 1

outputs:
  output:
    type: File
    outputBinding:
      glob: vardict_app_output.vcf


stdout: vardict_app_output.vcf


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
