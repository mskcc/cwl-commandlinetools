class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  foaf: 'http://xmlns.com/foaf/0.1/'
id: bedtools_merge
baseCommand:
  - bedtools
  - merge
inputs:
  - id: input
    type: File
    inputBinding:
      position: 5
      prefix: '-i'
      shellQuote: false
    doc: BEDgraph format file generated from Bedtools Genomecov module
  - id: output_file_name
    type: string
  - id: memory_overhead
    type: int?
  - id: memory_per_job
    type: int?
  - id: number_of_threads
    type: int?
  - default: 0
    id: distance_between_features
    type: int?
    inputBinding:
      position: 0
      prefix: '-d'
      shellQuote: false
    doc: Maximum distance between features allowed for features to be merged.
outputs:
  - id: output_file
    type: File?
    outputBinding:
      glob: |-
        ${
            if (inputs.output_file_name.length>0)
              return inputs.output_file_name;
            return inputs.input.basename.replace('.bedgraph', '.bed');
          }
label: bedtools_merge
requirements:
  - class: ShellCommandRequirement
  - class: ResourceRequirement
    ramMin: 20000
    coresMin: 1
#     ramMin: "${\r  if(inputs.memory_per_job && inputs.memory_overhead) {\r   \r    return inputs.memory_per_job + inputs.memory_overhead\r  }\r  else if (inputs.memory_per_job && !inputs.memory_overhead){\r    \r   \treturn inputs.memory_per_job + 2000\r  }\r  else if(!inputs.memory_per_job && inputs.memory_overhead){\r    \r    return 8000 + inputs.memory_overhead\r  }\r  else {\r    \r  \treturn 8000 \r  }\r}"
#     coresMin: "${\r  if (inputs.number_of_threads) {\r    \r   \treturn inputs.number_of_threads \r  }\r  else {\r    \r    return 1\r  }\r}"
  - class: DockerRequirement
    dockerPull: 'biocontainers/bedtools:v2.28.0_cv2'
  - class: InlineJavascriptRequirement
stdout: |-
  ${
      if (inputs.output_file_name.length>0)
        return inputs.output_file_name;
      return inputs.input.basename.replace('.bedgraph', '.bed');
    }
'dct:contributor':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:sumans@mskcc.org'
        'foaf:name': Shalabh Suman
    'foaf:name': Memorial Sloan Kettering Cancer Center
'dct:creator':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:sumans@mskcc.org'
        'foaf:name': Shalabh Suman
    'foaf:name': Memorial Sloan Kettering Cancer Center
'doap:release':
  - class: 'doap:Version'
    'doap:name': bedtools
    'doap:revision': v2.28.0_cv2
