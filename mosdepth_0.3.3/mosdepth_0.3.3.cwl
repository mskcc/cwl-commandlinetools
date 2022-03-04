class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: mosdepth_0_3_3
baseCommand:
  - mosdepth
inputs:
  - id: memory_per_job
    type: int?
    doc: Memory per job in megabytes
  - id: memory_overhead
    type: int?
    doc: Memory overhead per job in megabytes
  - id: number_of_threads
    type: int?
  - id: bed
    type: File?
    inputBinding:
      position: 0
      prefix: '-b'
      shellQuote: false
    doc: optional BED file or (integer) window-sizes.
  - id: chrom
    type: File?
    inputBinding:
      position: 0
      prefix: '-c'
      shellQuote: false
    doc: chromosome to restrict depth calculation.
  - id: input_bam
    type: File
    secondaryFiles:
      - ^.bai
  - id: prefix
    type: File
    doc: Prefix for the output files
outputs:
  - id: mosdepth_output
    type: File?
    outputBinding:
      glob: $(inputs.prefix).*
doc: 'fast BAM/CRAM depth calculation for WGS, exome, or targeted sequencing.'
label: mosdepth_0.3.3
arguments:
  - position: 0
    prefix: '-t'
    valueFrom: $(runtime.cores)
  - position: 99
    valueFrom: $(inputs.prefix)
  - position: 100
    valueFrom: $(inputs.input_bam)
requirements:
  - class: ShellCommandRequirement
  - class: ResourceRequirement
    ramMin: 17000
    coresMin: 2
  - class: DockerRequirement
    dockerPull: 'ghcr.io/msk-access/mosdepth:0.3.3'
  - class: InlineJavascriptRequirement
