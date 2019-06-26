class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  foaf: 'http://xmlns.com/foaf/0.1/'
  sbg: 'https://www.sevenbridges.com/'
id: trim_galore_0_2_5a
baseCommand:
  - trim_galore
inputs:
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
    type: File?
    inputBinding:
      position: 1000
    doc: READ2 of the pair-end run
  - 'sbg:toolDefaultValue': '20'
    id: length
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
  - 'sbg:toolDefaultValue': '20'
    id: quality
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
  - 'sbg:toolDefaultValue': '1'
    id: stringency
    type: int?
    inputBinding:
      position: 0
      prefix: '-s'
    doc: >-
      Overlap with adapter sequence required to trim a sequence. Defaults to a
      very stringent setting of '1', i.e. even a single bp of overlapping
      sequence will be trimmed of the 3' end of any read.
  - id: suppress_warn
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--suppress_warn'
    doc: If specified any output to STDOUT or STDERR will be suppressed.
  - 'sbg:toolDefaultValue': '0.1'
    id: error_rate
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
      glob: '$(inputs.fastq1.basename.replace(''.fastq.gz'', ''_cl.fastq.gz''))'
  - id: clfastq2
    type: File
    outputBinding:
      glob: '$(inputs.fastq2.basename.replace(''.fastq.gz'', ''_cl.fastq.gz''))'
  - id: clstats1
    type: File
    outputBinding:
      glob: '$(inputs.fastq1.basename.replace(''.fastq.gz'', ''_cl.stats''))'
  - id: clstats2
    type: File
    outputBinding:
      glob: '$(inputs.fastq1.basename.replace(''.fastq.gz'', ''_cl.stats''))'
label: trim_galore_0.2.5a
requirements:
  - class: ResourceRequirement
    ramMin: 16
    coresMin: 2
  - class: DockerRequirement
    dockerPull: 'mskcc/trim_galore:0.2.5a'
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
    'doap:revision': 0.2.5
  - class: 'doap:Version'
    'doap:name': cwl-wrapper
    'doap:revision': 1.0.0
