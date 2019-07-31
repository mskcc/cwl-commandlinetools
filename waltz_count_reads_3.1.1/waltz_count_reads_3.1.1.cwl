class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  foaf: 'http://xmlns.com/foaf/0.1/'
  edam: http://edamontology.org/
id: waltz_count_reads
baseCommand:
  - java
inputs:
  - id: bam
    type: File
    inputBinding:
      position: 1
  - id: gene_list
    type: File
    inputBinding:
      position: 3
  - default: 20
    id: coverage_threshold
    type: int
    inputBinding:
      position: 2
  - id: memory_per_job
    type: int?
  - id: memory_overhead
    type: int?
  - id: number_of_threads
    type: int?
  - id: bed_file
    type: File
    inputBinding:
      position: 4
outputs:
  - id: covered_regions
    type: File
    outputBinding:
      glob: '*.covered-regions'
  - id: fragment_sizes
    type: File
    outputBinding:
      glob: '*.fragment-sizes'
  - id: read_counts
    type: File
    outputBinding:
      glob: '*.read-counts'
label: waltz_count_reads
arguments:
  - position: 0
    prefix: ''
    separate: false
    valueFrom: '-server'
  - position: 0
    prefix: ''
    separate: false
    valueFrom: "${\n  if(inputs.memory_per_job && inputs.memory_overhead) {\n   \n    if(inputs.memory_per_job % 1000 == 0) {\n    \t\n      return \"-Xms\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      \n      return \"-Xms\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\" \n    }\n  }\n  else if (inputs.memory_per_job && !inputs.memory_overhead){\n    \n    if(inputs.memory_per_job % 1000 == 0) {\n    \t\n      return \"-Xms\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      \n      return \"-Xms\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\" \n    }\n  }\n  else if(!inputs.memory_per_job && inputs.memory_overhead){\n    \n    return \"-Xms4G\"\n  }\n  else {\n    \n  \treturn \"-Xms4G\"\n  }\n}"
  - position: 0
    prefix: ''
    separate: false
    valueFrom: "${\n  if(inputs.memory_per_job && inputs.memory_overhead) {\n   \n    if(inputs.memory_per_job % 1000 == 0) {\n    \t\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      \n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\" \n    }\n  }\n  else if (inputs.memory_per_job && !inputs.memory_overhead){\n    \n    if(inputs.memory_per_job % 1000 == 0) {\n    \t\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      \n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\" \n    }\n  }\n  else if(!inputs.memory_per_job && inputs.memory_overhead){\n    \n    return \"-Xmx4G\"\n  }\n  else {\n    \n  \treturn \"-Xmx4G\"\n  }\n}"
  - position: 0
    prefix: ''
    separate: false
    valueFrom: '-cp'
  - position: 0
    prefix: ''
    separate: false
    valueFrom: /usr/local/bin/Waltz.jar
  - position: 0
    prefix: ''
    separate: false
    valueFrom: org.mskcc.juber.waltz.countreads.CountReads
requirements:
  - class: ResourceRequirement
    ramMin: 8000
    coresMin: 1
#     ramMin: "${\r  if(inputs.memory_per_job && inputs.memory_overhead) {\r   \r    return inputs.memory_per_job + inputs.memory_overhead\r  }\r  else if (inputs.memory_per_job && !inputs.memory_overhead){\r    \r   \treturn inputs.memory_per_job + 2000\r  }\r  else if(!inputs.memory_per_job && inputs.memory_overhead){\r    \r    return 8000 + inputs.memory_overhead\r  }\r  else {\r    \r  \treturn 8000 \r  }\r}"
#     coresMin: "${\r  if (inputs.number_of_threads) {\r    \r   \treturn inputs.number_of_threads \r  }\r  else {\r    \r    return 1\r  }\r}"
  - class: DockerRequirement
    dockerPull: 'mskcc/waltz:1.0.0'
  - class: InlineJavascriptRequirement
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
    'doap:name': waltz
    'doap:revision': 3.1.1
