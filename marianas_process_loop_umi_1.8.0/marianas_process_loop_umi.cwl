class: CommandLineTool
cwlVersion: v1.0
id: marianas_process_loop_umi_cwl
baseCommand:
  - java
inputs:
  - id: fastq1
    type: File
    inputBinding:
      position: 1
  - id: fastq2
    type: File
    inputBinding:
      position: 2
  - id: umi_length
    type: int
    inputBinding:
      position: 3
  - id: memory_per_job
    type: int?
    inputBinding:
      position: 0
    doc: Memory per job in megabytes
  - id: memory_overhead
    type: int?
    inputBinding:
      position: 0
outputs:
  - id: processed_fastq_1
    type: File
    outputBinding:
      glob: '$(inputs.fastq1.basename.replace(''.fastq'', ''_umi-clipped.fastq''))'
  - id: processed_fastq_2
    type: File
    outputBinding:
      glob: '$(inputs.fastq2.basename.replace(''.fastq'', ''_umi-clipped.fastq''))'
  - id: clipping_info
    type: File
    outputBinding:
      glob: info.txt
  - id: composite_umi_frequencies
    type: File
    outputBinding:
      glob: composite-umi-frequencies.txt
label: marianas_process_loop_umi.cwl
arguments:
  - position: 0
    separate: false
    valueFrom: '-server'
  - position: 0
    prefix: ''
    separate: false
    valueFrom: |-
      ${
        if(inputs.memory_per_job && inputs.memory_overhead) {   
          if(inputs.memory_per_job % 1000 == 0) {
            return "-Xms" + (inputs.memory_per_job/1000).toString() + "G"
          }
          else {
            return "-Xms" + Math.floor((inputs.memory_per_job/1000)).toString() + "G" 
          }
        }
        else if (inputs.memory_per_job && !inputs.memory_overhead){
          if(inputs.memory_per_job % 1000 == 0) {
            return "-Xms" + (inputs.memory_per_job/1000).toString() + "G"
          }
          else {
            return "-Xms" + Math.floor((inputs.memory_per_job/1000)).toString() + "G" 
          }
        }
        else if(!inputs.memory_per_job && inputs.memory_overhead){
          return "-Xms8G"
        }
        else {
            return "-Xms8G"
        }
      }
  - position: 0
    prefix: ''
    separate: false
    valueFrom: |-
      ${
        if(inputs.memory_per_job && inputs.memory_overhead) {   
          if(inputs.memory_per_job % 1000 == 0) {
            return "-Xmx" + (inputs.memory_per_job/1000).toString() + "G"
          }
          else {
            return "-Xmx" + Math.floor((inputs.memory_per_job/1000)).toString() + "G" 
          }
        }
        else if (inputs.memory_per_job && !inputs.memory_overhead){
          if(inputs.memory_per_job % 1000 == 0) {
            return "-Xmx" + (inputs.memory_per_job/1000).toString() + "G"
          }
          else {
            return "-Xmx" + Math.floor((inputs.memory_per_job/1000)).toString() + "G" 
          }
        }
        else if(!inputs.memory_per_job && inputs.memory_overhead){
          return "-Xmx8G"
        }
        else {
            return "-Xmx8G"
        }
      }
  - position: 0
    separate: false
    valueFrom: '-cp'
  - position: 0
    separate: false
    valueFrom: /usr/bin/Marianas-1.8.1.jar
  - position: 0
    separate: false
    valueFrom: org.mskcc.marianas.umi.duplex.fastqprocessing.ProcessLoopUMIFastq
requirements:
  - class: ResourceRequirement
    ramMin: |-
      ${
          if (inputs.memory_per_job && inputs.memory_overhead) {
              return inputs.memory_per_job + inputs.memory_overhead
          } else if (inputs.memory_per_job && !inputs.memory_overhead) {
              return inputs.memory_per_job + 2000
          } else if (!inputs.memory_per_job && inputs.memory_overhead) {
              return 8000 + inputs.memory_overhead
          } else {
              return 10000
          }
      }
    coresMin: 1
  - class: DockerRequirement
    dockerPull: 'mskcc/marianas:0.1.0'
  - class: InlineJavascriptRequirement
'dct:contributor':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:johnsoni@mskcc.org'
        'foaf:name': Ian Johnson
    'foaf:name': Memorial Sloan Kettering Cancer Center
'dct:creator':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:johnsoni@mskcc.org'
        'foaf:name': Ian Johnson
    'foaf:name': Memorial Sloan Kettering Cancer Center
'doap:release':
  - class: 'doap:Version'
    'doap:name': Marianas
    'doap:revision': 1.8.1
  - class: 'doap:Version'
    'doap:name': cwl-wrapper
    'doap:revision': 1.0.0
