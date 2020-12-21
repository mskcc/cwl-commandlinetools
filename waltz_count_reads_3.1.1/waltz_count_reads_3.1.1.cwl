class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  edam: 'http://edamontology.org/'
  foaf: 'http://xmlns.com/foaf/0.1/'
  sbg: 'https://www.sevenbridges.com/'
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
  - id: waltz_count_reads_covered_regions
    type: File
    outputBinding:
      glob: '*.covered-regions'
  - id: waltz_count_reads_fragment_sizes
    type: File
    outputBinding:
      glob: '*.fragment-sizes'
  - id: waltz_count_reads_read_counts
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
  - class: DockerRequirement
    dockerPull: 'ghcr.io/msk-access/waltz:3.1.1'
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
