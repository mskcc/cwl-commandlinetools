class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  foaf: 'http://xmlns.com/foaf/0.1/'
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - delly
inputs:
  - id: memory_per_job
    type: int?
    doc: Memory per job in megabytes
  - id: memory_overhead
    type: int?
    doc: Memory overhead per job in megabytes
  - id: number_of_threads
    type: int?
  - id: out_file
    type: string?
    inputBinding:
      position: 0
      prefix: '-o'
      shellQuote: false
    doc: The name to be used for the output bcf file
  - id: reference_genome
    type: File
    inputBinding:
      position: 0
      prefix: '-g'
      shellQuote: false
    doc: reference genome fasta file
  - id: input_bams
    type:
      - File
      - type: array
        items: File
    inputBinding:
      position: 99
      shellQuote: false
    doc: >-
      an indexed bam tumor file, an indexed bam control file or it can be an
      array of indexed bam files
    secondaryFiles:
      - ^.bai
  - id: exclude_regions
    type: File?
    inputBinding:
      position: 0
      prefix: '-x'
      shellQuote: false
    doc: file with regions to exclude
  - id: vcffile
    type: File?
    inputBinding:
      position: 0
      prefix: '-v'
      shellQuote: false
    doc: input VCF/BCF file for genotyping
  - id: svtype
    type: string?
    inputBinding:
      position: 0
      prefix: '-t'
      shellQuote: false
    doc: 'SV type to compute [DEL, INS, DUP, INV, BND, ALL]'
outputs:
  - id: bcf_out
    type: File
    outputBinding:
      glob: $(inputs.out_file)
arguments:
  - call
requirements:
  - class: ShellCommandRequirement
  - class: ResourceRequirement
    ramMin: 60000
    coresMin: 16
  - class: InlineJavascriptRequirement
hints:
  - class: DockerRequirement
    dockerPull: 'ghcr.io/msk-access/delly:0.9.1'
'dct:contributor':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:kumarn1@mskcc.org'
        'foaf:name': Eric Buehlere
    'foaf:name': Memorial Sloan Kettering Cancer Center
'dct:creator':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:shahr2@mskcc.org'
        'foaf:name': Ronak Shah
    'foaf:name': Memorial Sloan Kettering Cancer Center
'doap:release':
  - class: 'doap:Version'
    'doap:name': delly
    'doap:revision': 0.9.1
