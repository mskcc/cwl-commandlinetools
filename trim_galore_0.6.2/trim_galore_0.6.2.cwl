class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  foaf: 'http://xmlns.com/foaf/0.1/'
id: trim_galore_0_6_2
baseCommand:
  - trim_galore
inputs:
  - id: memory_per_job
    type: int
    inputBinding:
      positon: 0
    doc: >- 
        Memory per job in megabytes
  - id: memory_overhead
    type: int
    inputBinding:
      position: 0
    doc: >-
        Memory overhead per job in megabytes
  - id: number_of_threads
    type: int?
    inputBinding:
      position: 0
      prefix: '--threads'
  - id: adapter
    type: string
    inputBinding:
      position: 0
      prefix: '-a'
    doc: >-
      Adapter sequence to be trimmed. If not specified explicitely, the first
      13bp of the Illumina adapter 'AGATCGGAAGAGC' will be used by default.
  - id: adapter2
    type: string
    inputBinding:
      position: 0
      prefix: '-a2'
    doc: >-
      Optional adapter sequence to be trimmed off read 2 of paired-end files.
      This option requires '--paired' to be specified as well
  - id: fastq1
    type: File
    inputBinding:
      position: 999
    doc: READ1 of the paired-end run
  - id: fastq2
    type: File
    inputBinding:
      position: 1000
    doc: READ2 of the pair-end run
  - id: length
    type: int?
    inputBinding:
      position: 0
      prefix: '--length'
    doc: >-
      Discard reads that became shorter than length INT because of either
      quality or adapter trimming. A value of '0' effectively disables this
      behaviour. Default: 20 bp.
  - id: paired
    type: boolean
    inputBinding:
      position: 0
      prefix: '--paired'
    doc: >-
      This option performs length trimming of quality/adapter/RRBS trimmed reads
      for paired-end files. To pass the validation test, both sequences of a
      sequence pair are required to have a certain minimum length which is
      governed by the option --length (see above). If only one read passes this
      length threshold the other read can be rescued (see option
      --retain_unpaired). Using this option lets you discard too short read
      pairs without disturbing the sequence-by-sequence order of FastQ files
      which is required by many aligners.
  - id: gzip
    type: boolean
    inputBinding:
      position: 0
      prefix: '--gzip'
    doc: >-
      Compress the output file with gzip. If the input files are gzip-compressed
      the output files will be automatically gzip compressed as well.
  - id: quality
    type: int?
    inputBinding:
      position: 0
      prefix: '-q'
    doc: >-
      Trim low-quality ends from reads in addition to adapter removal. For RRBS
      samples, quality trimming will be performed first, and adapter trimming is
      carried in a second round. Other files are quality and adapter trimmed in
      a single pass. The algorithm is the same as the one used by BWA (Subtract
      INT from all qualities; compute partial sums from all indices to the end
      of the sequence; cut sequence at the index at which the sum is minimal).
      Default Phred score: 20.
  - id: stringency
    type: int?
    inputBinding:
      position: 0
      prefix: '--stringency'
    doc: >-
      "Overlap with adapter sequence required to trim a sequence. Defaults to a
      very stringent setting of '1', i.e. even a single bp of overlapping
      sequence will be trimmed of the 3' end of any read."
  - id: suppress_warn
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--suppress_warn'
    doc: If specified any output to STDOUT or STDERR will be suppressed.
  - id: error_rate
    type: float?
    inputBinding:
      position: 0
      prefix: '-e'
    doc: >-
      Maximum allowed error rate (no. of errors divided by the length of the
      matching region) (default: 0.1)
outputs:
  - id: clfastq1
    type: File
    outputBinding:
      glob: '$(inputs.fastq1.basename.replace(''.fastq.gz'', ''_val_1.fq.gz''))'
  - id: clfastq2
    type: File
    outputBinding:
      glob: '$(inputs.fastq2.basename.replace(''.fastq.gz'', ''_val_1.fq.gz''))'
  - id: clstats1
    type: File
    outputBinding:
      glob: >-
        $(inputs.fastq1.basename.replace('.fastq.gz',
        '.fastq.gz_trimming_report.txt'))
  - id: clstats2
    type: File
    outputBinding:
      glob: >-
        $(inputs.fastq1.basename.replace('.fastq.gz',
        '.fastq.gz_trimming_report.txt'))
label: trim_galore_0.6.2
requirements:
  - class: ResourceRequirement
    ramMin: "{\r  if(inputs.memory_per_job && inputs.memory_overhead) {\r   \r    return inputs.memory_per_job + inputs.memory_overhead\r  }\r  else if (inputs.memory_per_job && !inputs.memory_overhead){\r    \r   \treturn inputs.memory_per_job + 2000\r  }\r  else if(!inputs.memory_per_job && inputs.memory_overhead){\r    \r    return 15000 + inputs.memory_overhead\r  }\r  else {\r    \r  \treturn 17000 \r  }\r}0"
    coresMin: "{\r  if (inputs.number_of_threads) {\r    \r   \treturn inputs.number_of_threads \r  }\r  else {\r    \r    return 4\r  }\r}"
  - class: DockerRequirement
    dockerPull: 'mskcc/trim_galore:0.1.0'
  - class: InlineJavascriptRequirement
'dct:contributor':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:shahr2@mskcc.org'
        'foaf:name': Ronak Shah
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
    'doap:name': trim_galore
    'doap:revision': 0.6.2
  - class: 'doap:Version'
    'doap:name': cwl-wrapper
    'doap:revision': 1.0.0
