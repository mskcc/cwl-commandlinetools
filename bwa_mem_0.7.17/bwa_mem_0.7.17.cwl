class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - bwa
  - mem
inputs:
  - id: memory_per_job
    type: int?
    doc: Memory per job in megabytes
  - id: memory_overhead
    type: int?
    doc: Memory overhead per job in megabytes
  - id: number_of_threads
    type: int?
  - id: reads
    type: 'File[]'
    inputBinding:
      position: 3
  - id: reference
    type: File
    inputBinding:
      position: 2
    secondaryFiles:
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa
      - .fai
  - id: A
    type: int?
    inputBinding:
      position: 0
      prefix: '-A'
    doc: >-
      score for a sequence match, which scales options -TdBOELU unless
      overridden [1]
  - id: B
    type: int?
    inputBinding:
      position: 0
      prefix: '-B'
    doc: 'penalty for a mismatch [4]'
  - id: C
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-C'
    doc: append FASTA/FASTQ comment to SAM output
  - id: E
    type: 'int[]?'
    inputBinding:
      position: 0
      prefix: '-E'
      itemSeparator: ','
    doc: 'gap extension penalty; a gap of size k cost ''{-O} + {-E}*k'' [1,1]'
  - id: L
    type: 'int[]?'
    inputBinding:
      position: 0
      prefix: '-L'
      itemSeparator: ','
    doc: 'penalty for 5''- and 3''-end clipping [5,5]'
  - id: M
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-M'
  - id: O
    type: 'int[]?'
    inputBinding:
      position: 0
      prefix: '-O'
      itemSeparator: ','
    doc: 'gap open penalties for deletions and insertions [6,6]'
  - id: P
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-P'
    doc: skip pairing; mate rescue performed unless -S also in use
  - id: S
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-S'
    doc: skip mate rescue
  - id: T
    type: int?
    inputBinding:
      position: 0
      prefix: '-T'
    doc: 'minimum score to output [30]'
  - id: U
    type: int?
    inputBinding:
      position: 0
      prefix: '-U'
    doc: 'penalty for an unpaired read pair [17]'
  - id: a
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-a'
    doc: output all alignments for SE or unpaired PE
  - id: c
    type: int?
    inputBinding:
      position: 0
      prefix: '-c'
    doc: 'skip seeds with more than INT occurrences [500]'
  - id: d
    type: int?
    inputBinding:
      position: 0
      prefix: '-d'
    doc: 'off-diagonal X-dropoff [100]'
  - id: k
    type: int?
    inputBinding:
      position: 0
      prefix: '-k'
    doc: 'minimum seed length [19]'
  - id: K
    type: int?
    inputBinding:
      position: 0
      prefix: '-K'
    doc: >-
      process INT input bases in each batch regardless of nThreads (for
      reproducibility) []
  - id: output
    type: string?
  - id: p
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-p'
    doc: smart pairing (ignoring in2.fq)
  - id: r
    type: float?
    inputBinding:
      position: 0
      prefix: '-r'
    doc: 'look for internal seeds inside a seed longer than {-k} * FLOAT [1.5]'
  - id: v
    type: int?
    inputBinding:
      position: 0
      prefix: '-v'
    doc: 'verbosity level: 1=error, 2=warning, 3=message, 4+=debugging [3]'
  - id: w
    type: int?
    inputBinding:
      position: 0
      prefix: '-w'
    doc: 'band width for banded alignment [100]'
  - id: 'y'
    type: int?
    inputBinding:
      position: 0
      prefix: '-y'
    doc: 'seed occurrence for the 3rd round seeding [20]'
  - id: D
    type: float?
    inputBinding:
      position: 0
      prefix: '-D'
    doc: >-
      drop chains shorter than FLOAT fraction of the longest overlapping chain
      [0.50]
  - id: W
    type: int?
    inputBinding:
      position: 0
      prefix: '-W'
    doc: 'discard a chain if seeded bases shorter than INT [0]'
  - id: m
    type: int?
    inputBinding:
      position: 0
      prefix: '-m'
    doc: 'perform at most INT rounds of mate rescues for each read [50]'
  - id: e
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-e'
  - id: x
    type: string?
    inputBinding:
      position: 0
      prefix: '-x'
    doc: >-
      read type. Setting -x changes multiple parameters unless overridden [null]
      pacbio: -k17 -W40 -r10 -A1 -B1 -O1 -E1 -L0  (PacBio reads to ref) ont2d:
      -k14 -W20 -r10 -A1 -B1 -O1 -E1 -L0  (Oxford Nanopore 2D-reads to ref)
      intractg: -B9 -O16 -L5  (intra-species contigs to ref)
  - id: H
    type:
      - File?
      - string?
    inputBinding:
      position: 0
      prefix: '-H'
    doc: >-
      if there are <INT hits with score >80% of the max score, output all in XA
      [5,200]
  - id: j
    type: File?
    inputBinding:
      position: 0
      prefix: '-j'
    doc: >-
      treat ALT contigs as part of the primary assembly (i.e. ignore
      <idxbase>.alt file)
  - id: he
    type: 'int[]?'
    inputBinding:
      position: 0
      prefix: '-h'
      itemSeparator: ','
    doc: >-
      if there are <INT hits with score >80% of the max score, output all in XA
      [5,200]
  - id: V
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-V'
    doc: output the reference FASTA header in the XR tag
  - id: 'Y'
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-Y'
    doc: use soft clipping for supplementary alignments
  - id: I
    type: string?
    inputBinding:
      position: 0
      prefix: '-M'
  - id: R
    type: string?
    doc: 'STR read group header line such as ''@RG\tID -foo\tSM -bar'' [null]'
  - id: sample_id
    type: string?
  - id: lane_id
    type: string?
  - id: platform
    type: string?
  - id: platform_unit
    type: string?
  - id: center_name
    type: string?
  - id: library_id
    type: string?
outputs:
  - id: bwa_mem_output_sam
    type: File
    outputBinding:
      glob: |-
        ${
          if (inputs.output)
            return inputs.output;
          return inputs.reads[0].basename.replace(/(fastq.gz)|(fq.gz)/, 'sam');
        }
arguments:
  - position: 0
    prefix: '-t'
    valueFrom: $(runtime.cores)
  - position: 0
    prefix: '-R'
    valueFrom: |-
      ${
          if (inputs.sample_id) {
              var rg_id = "@RG\\tID:" + inputs.sample_id + "\\tSM:" + inputs.sample_id;
              if (inputs.library_id) {
                  rg_id += "\\tLB:" + inputs.library_id;
              } if (inputs.platform) {
                  rg_id += "\\tPL:" + inputs.platform;
              } if (inputs.platform_unit) {
                  rg_id += "\\tPU:" + inputs.platform_unit;
              } if (inputs.center_name) {
                  rg_id += "\\tCN:" + inputs.center_name;
              }
              return rg_id
          } else {
              return inputs.R
          }
      }
requirements:
  - class: ResourceRequirement
    ramMin: "${
      if(inputs.memory_per_job && inputs.memory_overhead) {
        return inputs.memory_per_job + inputs.memory_overhead
      }
      else if (inputs.memory_per_job && !inputs.memory_overhead){
        return inputs.memory_per_job + 2000
      }
      else if(!inputs.memory_per_job && inputs.memory_overhead){
        return 32000 + inputs.memory_overhead
      }
      else {
        return 32000
      }
    }"
    coresMin: "${
          if (inputs.number_of_threads) {
            return inputs.number_of_threads
          }
          else {
            return 16
          }
        }"
  - class: DockerRequirement
    dockerPull: 'mskaccess/bwa_mem_0.7.17:0.1.0'
  - class: InlineJavascriptRequirement
stdout: |-
  ${
    if (inputs.output)
      return inputs.output;
    return inputs.reads[0].basename.replace(/(fastq.gz)|(fq.gz)/, 'sam');
  }
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
        'foaf:mbox': 'mailto:johnsoni@mskcc.org'
        'foaf:name': Ian Johnson
    'foaf:name': Memorial Sloan Kettering Cancer Center
'doap:release':
  - class: 'doap:Version'
    'doap:name': bwa
    'doap:revision': 0.7.17