#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand:
- perl
- /usr/bin/vardict/bin/var2vcf_valid.pl
id: vardict_var2vcf

arguments:
- position: 0
  prefix: -N
  valueFrom: "${\n    return inputs.N + \"|\" + inputs.N2;\n}"

requirements:
  InlineJavascriptRequirement: {}
  ResourceRequirement:
    coresMin: 4
    ramMin: 32000
  DockerRequirement:
    dockerPull: ghcr.io/msk-access/vardictjava:1.8.2

inputs:

  S:
    type: boolean?
    doc: If set variants that didnt pass filters will not be present in VCF file.
    inputBinding:
      position: 0
      prefix: -S

  N:
    type: string?
    doc: Tumor Sample Name

  f:
    type: string?
    doc: The threshold for allele frequency, default - 0.05 or 5%%
    inputBinding:
      position: 0
      prefix: -f

  vcf:
    type: string
    doc: output vcf file

  input_vcf:
    type: File?

outputs:
  output:
    type: File
    outputBinding:
      glob: ${ return inputs.vcf; }

stdin: $(inputs.input_vcf.path)
stdout: ${ return inputs.vcf; }

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
