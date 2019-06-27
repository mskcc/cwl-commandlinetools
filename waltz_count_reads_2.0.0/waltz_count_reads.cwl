class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: waltz_count_reads_test
baseCommand:
  - java
inputs:
  - id: bam
    type: File?
    inputBinding:
      position: 1
  - id: gene_list
    type: File?
    inputBinding:
      position: 3
  - id: bed_file
    type: File?
    inputBinding:
      position: 4
  - id: coverage_threshold
    type: int?
    inputBinding:
      position: 2
outputs:
  - id: covered_regions
    type: File?
    outputBinding:
      glob: '*.covered-regions'
  - id: fragment_sizes
    type: File?
    outputBinding:
      glob: $("*.fragment-sizes")
  - id: read_counts
    type: File?
    outputBinding:
      glob: '*.read-counts'
label: waltz_count_reads_test
arguments:
  - position: 0
    prefix: ''
    valueFrom: '-server'
  - position: 0
    prefix: ''
    valueFrom: '-Xms$(parseInt(runtime.ram)/1000 - 2)g'
  - position: 0
    prefix: ''
    valueFrom: '-Xmx$(parseInt(runtime.ram)/1000 - 2)g'
  - position: 0
    prefix: ''
    valueFrom: '-cp'
  - position: 0
    prefix: ''
    valueFrom: /usr/local/bin/Waltz-2.0.jar
  - position: 0
    prefix: ''
    valueFrom: org.mskcc.juber.waltz.countreads.CountReads
requirements:
  - class: ResourceRequirement
    ramMin: 8000
    coresMin: 1
  - class: DockerRequirement
    dockerPull: 'mskcc/waltz:1.0.1'
  - class: InlineJavascriptRequirement
