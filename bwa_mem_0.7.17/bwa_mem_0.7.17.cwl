class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - bwa
  - mem
inputs:
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
  - id: sample_id
    type: string
  - id: lane_id
    type: string?
  - id: A
    doc: score for a sequence match, which scales options -TdBOELU unless overridden [1]
    type: int?
    inputBinding:
      position: 0
      prefix: '-A'
  - id: B
    doc: penalty for a mismatch [4]
    type: int?
    inputBinding:
      position: 0
      prefix: '-B'
  - id: C
    doc: append FASTA/FASTQ comment to SAM output
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-C'
  - id: E
    doc: gap extension penalty; a gap of size k cost '{-O} + {-E}*k' [1,1]
    type: 'int[]?'
    inputBinding:
      position: 0
      prefix: '-E'
      itemSeparator: ','
  - id: L
    doc: penalty for 5'- and 3'-end clipping [5,5]
    type: 'int[]?'
    inputBinding:
      position: 0
      prefix: '-L'
      itemSeparator: ','
  - id: M
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-M'
  - id: O
    doc: gap open penalties for deletions and insertions [6,6]
    type: 'int[]?'
    inputBinding:
      position: 0
      prefix: '-O'
      itemSeparator: ','
  - id: P
    doc: skip pairing; mate rescue performed unless -S also in use
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-P'
  - id: S
    doc: skip mate rescue
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-S'
  - id: T
    doc: minimum score to output [30]
    type: int?
    inputBinding:
      position: 0
      prefix: '-T'
  - id: U
    doc: penalty for an unpaired read pair [17]
    type: int?
    inputBinding:
      position: 0
      prefix: '-U'
  - id: a
    doc: output all alignments for SE or unpaired PE
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-a'
  - id: c
    doc: skip seeds with more than INT occurrences [500]
    type: int?
    inputBinding:
      position: 0
      prefix: '-c'
  - id: d
    doc: off-diagonal X-dropoff [100]
    type: int?
    inputBinding:
      position: 0
      prefix: '-d'
  - id: k
    doc: minimum seed length [19]
    type: int?
    inputBinding:
      position: 0
      prefix: '-k'
  - id: K
    doc: process INT input bases in each batch regardless of nThreads (for reproducibility) []
    type: int?
    inputBinding:
      position: 0
      prefix: '-K'
  - id: output
    type: string?
  - id: p
    doc: smart pairing (ignoring in2.fq)
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-p'
  - id: r
    doc: look for internal seeds inside a seed longer than {-k} * FLOAT [1.5]
    type: float?
    inputBinding:
      position: 0
      prefix: '-r'
  - id: v
    doc: 'verbosity level: 1=error, 2=warning, 3=message, 4+=debugging [3]'
    type: int?
    inputBinding:
      position: 0
      prefix: '-v'
  - id: w
    doc: band width for banded alignment [100]
    type: int?
    inputBinding:
      position: 0
      prefix: '-w'
  - id: 'y'
    doc: seed occurrence for the 3rd round seeding [20]
    type: int?
    inputBinding:
      position: 0
      prefix: '-y'
  - id: D
    doc: drop chains shorter than FLOAT fraction of the longest overlapping chain [0.50]
    type: float?
    inputBinding:
      position: 0
      prefix: '-D'
  - id: W
    doc: discard a chain if seeded bases shorter than INT [0]
    type: int?
    inputBinding:
      position: 0
      prefix: '-W'
  - id: m
    doc: perform at most INT rounds of mate rescues for each read [50]
    type: int?
    inputBinding:
      position: 0
      prefix: '-m'
  - id: e
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-e'
  - id: x
    doc: >-
        read type. Setting -x changes multiple parameters unless overridden [null]
        pacbio: -k17 -W40 -r10 -A1 -B1 -O1 -E1 -L0  (PacBio reads to ref)
        ont2d: -k14 -W20 -r10 -A1 -B1 -O1 -E1 -L0  (Oxford Nanopore 2D-reads to ref)
        intractg: -B9 -O16 -L5  (intra-species contigs to ref)
    type: string?
    inputBinding:
      position: 0
      prefix: '-x'
  - id: H
    doc: if there are <INT hits with score >80% of the max score, output all in XA [5,200]
    type:
      - File?
      - string?
    inputBinding:
      position: 0
      prefix: '-H'
  - id: j
    doc: treat ALT contigs as part of the primary assembly (i.e. ignore <idxbase>.alt file)
    type: File?
    inputBinding:
      position: 0
      prefix: '-j'
  - id: he
    doc: if there are <INT hits with score >80% of the max score, output all in XA [5,200]
    type: 'int[]?'
    inputBinding:
      position: 0
      prefix: '-h'
      itemSeparator: ','
  - id: V
    doc: output the reference FASTA header in the XR tag
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-V'
  - id: 'Y'
    doc: use soft clipping for supplementary alignments
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-Y'
  - id: I
    type: string?
    inputBinding:
      position: 0
      prefix: '-M'
  - id: t
    type: int?
    inputBinding:
      position: 0
      prefix: '-t'
    doc: Number of threads
  - id: R
    type: string?
    inputBinding:
      position: 0
      prefix: '-R'
    doc: 'STR read group header line such as ''@RG\tID -foo\tSM -bar'' [null]'
outputs:
  - id: output_sam
    type: File
    outputBinding:
      glob: |-
        ${
          if (inputs.output)
            return inputs.output;
          return inputs.reads[0].basename.replace(/(fastq.gz)|(fq.gz)/, 'sam');
        }
requirements:
  - class: ResourceRequirement
    ramMin: 32000
    coresMin: 4
  - class: DockerRequirement
    dockerPull: 'mskaccess/bwa_mem_0.7.17:0.1.0'
  - class: InlineJavascriptRequirement
stdout: |-
  ${
    if (inputs.output)
      return inputs.output;
    return inputs.reads[0].basename.replace(/(fastq.gz)|(fq.gz)/, 'sam');
  }
