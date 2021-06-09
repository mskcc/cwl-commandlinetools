class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  foaf: 'http://xmlns.com/foaf/0.1/'
  sbg: 'https://www.sevenbridges.com/'
id: biometrics_extract_0_2_12
baseCommand:
  - biometrics
  - extract
inputs:
  - id: sample_bam
    type: File
    inputBinding:
      position: 0
      prefix: --sample-bam
    secondaryFiles:
      - ^.bai
    doc: >-
      BAM file.
  - id: sample_sex
    type: string?
    inputBinding:
      position: 0
      prefix: --sample-sex
    doc: >-
      Expected sample sex (i.e. M or F).
  - id: sample_group
    type: string?
    inputBinding:
      position: 0
      prefix: --sample-group
    doc: >-
      The sample group (e.g. the sample patient ID).
  - id: sample_name
    type: string
    inputBinding:
      position: 0
      prefix: --sample-name
    doc: >-
      Sample name. If not specified, sample name is automatically figured out from the BAM file.
  - id: fafile
    type: File
    inputBinding:
      position: 0
      prefix: --fafile
    secondaryFiles:
      - ^.fasta.fai
    doc: >-
      Path to reference fasta.
  - id: vcf_file
    type: File
    inputBinding:
      position: 0
      prefix: --vcf
    doc: >-
      VCF file containing the SNPs to be queried.
  - id: bed_file
    type: File?
    inputBinding:
      position: 0
      prefix: --bed
    doc: >-
      BED file containing the intervals to be queried.
  - id: database
    type: string?
    inputBinding:
      position: 0
      prefix: --database
    doc: >-
      Directory to store the intermediate files after running the extraction step.
  - id: min_mapping_quality
    type: int?
    default: 1
    inputBinding:
      position: 0
      prefix: --min-mapping-quality
    doc: >-
      Minimum mapping quality of reads to be used for pileup.
  - id: min_base_quality
    type: int?
    default: 1
    inputBinding:
      position: 0
      prefix: --min-base-quality
    doc: >-
      Minimum base quality of reads to be used for pileup.
  - id: min_coverage
    type: int?
    default: 10
    inputBinding:
      position: 0
      prefix: --min-coverage
    doc: >-
      Minimum coverage to count a site.
  - id: min_homozygous_thresh
    type: float?
    default: 0.1
    inputBinding:
      position: 0
      prefix: --min-homozygous-thresh
    doc: >-
      Minimum threshold to define homozygous.
  - id: default_genotype
    type: string?
    inputBinding:
      position: 0
      prefix: --default-genotype
    doc: >-
      Default genotype if coverage is too low (options are Het or Hom).
outputs:
  - id: biometrics_extract_pickle
    type: File
    outputBinding:
      glob: |-
        ${
          if (inputs.database) {
            return inputs.database + '/' + inputs.sample_name + '.pickle';
          } else {
            return inputs.sample_name + '.pickle';
          }
        }
requirements:
  - class: ResourceRequirement
    ramMin: 16000
    coresMin: 2
  - class: DockerRequirement
    dockerPull: 'ghcr.io/msk-access/biometrics:0.2.12'
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
    'doap:name': biometrics
    'doap:revision': 0.2.12