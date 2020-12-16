class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  edam: 'http://edamontology.org/'
  foaf: 'http://xmlns.com/foaf/0.1/'
  sbg: 'https://www.sevenbridges.com/'
id: waltz_pileupmetrics
baseCommand:
  - java
inputs:
  - id: bam
    type: File
    inputBinding:
      position: 11
    secondaryFiles:
      - ^.bai
  - id: referece_fasta
    type: File
    inputBinding:
      position: 12
    secondaryFiles:
      - .fai
  - default: 20
    id: min_map_quality
    type: int
    inputBinding:
      position: 10
  - id: memory_per_job
    type: int?
  - id: memory_overhead
    type: int?
  - id: number_of_threads
    type: int?
  - id: bed_file
    type: File
    inputBinding:
      position: 13
outputs:
  - id: waltz_pileupmetrics_pileup
    type: File
    outputBinding:
      glob: '*-pileup.txt'
  - id: waltz_pileupmetrics_pileup_without_duplicates
    type: File
    outputBinding:
      glob: '*-pileup-without-duplicates.txt'
  - id: waltz_pileupmetrics_intervals
    type: File
    outputBinding:
      glob: '*-intervals.txt'
  - id: waltz_pileupmetrics_intervals_without_duplicates
    type: File
    outputBinding:
      glob: '*-intervals-without-duplicates.txt'
label: waltz_pileupmetrics
arguments:
  - position: 0
    prefix: ''
    separate: false
    valueFrom: '-server'
  - position: 1
    prefix: ''
    separate: false
    valueFrom: "${\n  if(inputs.memory_per_job && inputs.memory_overhead) {\n   \n    if(inputs.memory_per_job % 1000 == 0) {\n    \t\n      return \"-Xms\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      \n      return \"-Xms\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\" \n    }\n  }\n  else if (inputs.memory_per_job && !inputs.memory_overhead){\n    \n    if(inputs.memory_per_job % 1000 == 0) {\n    \t\n      return \"-Xms\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      \n      return \"-Xms\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\" \n    }\n  }\n  else if(!inputs.memory_per_job && inputs.memory_overhead){\n    \n    return \"-Xms4G\"\n  }\n  else {\n    \n  \treturn \"-Xms4G\"\n  }\n}"
  - position: 2
    prefix: ''
    separate: false
    valueFrom: "${\n  if(inputs.memory_per_job && inputs.memory_overhead) {\n   \n    if(inputs.memory_per_job % 1000 == 0) {\n    \t\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      \n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\" \n    }\n  }\n  else if (inputs.memory_per_job && !inputs.memory_overhead){\n    \n    if(inputs.memory_per_job % 1000 == 0) {\n    \t\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      \n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\" \n    }\n  }\n  else if(!inputs.memory_per_job && inputs.memory_overhead){\n    \n    return \"-Xmx4G\"\n  }\n  else {\n    \n  \treturn \"-Xmx4G\"\n  }\n}"
  - position: 3
    prefix: ''
    separate: false
    valueFrom: '-cp'
  - position: 4
    prefix: ''
    separate: false
    valueFrom: /usr/local/bin/Waltz.jar
  - position: 5
    prefix: ''
    separate: false
    valueFrom: org.mskcc.juber.waltz.Waltz
  - position: 6
    prefix: ''
    separate: false
    valueFrom: PileupMetrics
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
