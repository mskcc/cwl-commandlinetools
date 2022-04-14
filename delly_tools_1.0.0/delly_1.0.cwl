#!/usr/bin/env cwl-runner 
cwlVersion: v1.0
class: CommandLineTool
hints:
  DockerRequirement:
    dockerPull: 'ghcr.io/msk-access/delly_1.0:latest'
baseCommand: 
  - delly 
arguments: ["call"]
inputs:
    - id: out_file
      type: string?
      doc: name of output file 
      inputBinding:
        position: 0
        prefix: '-o'
    - id: input_bam 
      type: string[]
      inputBinding:
        prefix: -g
        position: 1
outputs:
  bcf_out:
    type: File
    outputBinding:
      glob: $(inputs.out_file)