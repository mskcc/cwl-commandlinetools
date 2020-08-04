class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  foaf: 'http://xmlns.com/foaf/0.1/'
  sbg: 'https://www.sevenbridges.com/'
id: calculate_noise_0_1_15
baseCommand:
  - calculate_noise
inputs:
  - id: reference
    type: File
    inputBinding:
      position: 0
      prefix: --ref_fasta
    doc: >-
      Path to reference fasta, containing all regions in bed_file
  - id: bam_file
    type: File
    inputBinding:
      position: 0
      prefix: --bam_file
    doc: >-
      Path to BAM file for calculating noise  [required]
  - id: bed_file
    type: File
    inputBinding:
      position: 0
      prefix: --bed_file
    doc: >-
      Path to BED file containing regions over which to calculate noise  [required]
  - id: output_prefix
    type: string
    inputBinding:
      position: 0
      prefix: --output_prefix
    doc: >-
      Prefix to include in all output file names
  - id: threshold
    type: float?
    inputBinding:
      position: 0
      prefix: --threshold
    doc: >-
      Alt allele frequency past which to ignore positions from the calculation.
  - id: truncate
    type: int?
    inputBinding:
      position: 0
      prefix: --truncate
    doc: >-
      Whether to exclude trailing bases from reads that only partially overlap the bed file (0 or 1)
  - id: min_mapq
    type: int?
    inputBinding:
      position: 0
      prefix: --min_mapq
    doc: >-
      Exclude reads with a lower mapping quality
  - id: min_basq
    type: int?
    inputBinding:
      position: 0
      prefix: --min_basq
    doc: >-
      Exclude bases with a lower base quality
outputs:
  - id: pileup
    type: File
    outputBinding:
      glob: |-
        ${
            return inputs.output_prefix + 'pileup.tsv'
        }
  - id: noise_positions
    type: File
    outputBinding:
      glob: |-
        ${
            return inputs.output_prefix + 'noise_positions.tsv'
        }
  - id: noise_acgt
    type: File
    outputBinding:
      glob: |-
        ${
            return inputs.output_prefix + 'noise_acgt.tsv'
        }
requirements:
  - class: ResourceRequirement
    ramMin: 8000
    coresMin: 1
  - class: DockerRequirement
    dockerPull: 'sequence_qc/0.1.15'
  - class: InlineJavascriptRequirement
'dct:contributor':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:murphyc4@mskcc.org'
        'foaf:name': Charlie Murphy
    'foaf:name': Memorial Sloan Kettering Cancer Center
'dct:creator':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:murphyc4@mskcc.org'
        'foaf:name': Charlie Murphy
    'foaf:name': Memorial Sloan Kettering Cancer Center
'doap:release':
  - class: 'doap:Version'
    'doap:name': sesquence_qc
    'doap:revision': 0.1.15
