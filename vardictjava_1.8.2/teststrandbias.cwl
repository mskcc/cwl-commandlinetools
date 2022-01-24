#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand:
- Rscript
- /usr/bin/vardict/bin/teststrandbias.R
id: teststrandbias

requirements:
  InlineJavascriptRequirement: {}
  ResourceRequirement:
    coresMin: 2
    ramMin: 12000
  DockerRequirement:
    dockerPull: ghcr.io/msk-access/vardictjava:1.8.2


inputs:
  input_vardict:
    type: File
outputs:
  output_var:
    type: File?
    outputBinding:
      glob: output_teststrandbias.var

stdin: $(inputs.input_vardict.path)
stdout: output_teststrandbias.var
