class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  foaf: 'http://xmlns.com/foaf/0.1/'
  sbg: 'https://www.sevenbridges.com/'
id: general_stats_parse
baseCommand:
  - python
  - /app/bin/coverage_report_single.py
inputs:
  - id: memory_per_job
    type: int?
    doc: Memory per job in megabytes
  - id: memory_overhead
    type: int?
    doc: Memory overhead per job in megabytes
  - id: number_of_threads
    type: int?
    doc: 'worker thread number, default is 2 (int [=2])'
  - id: exon_stats
    type: File
    inputBinding:
      position: 0
      prefix: '-e'
    doc: per exon statistics file (from `coverage_stats_single.py`)
  - id: gene_stats
    type: File
    inputBinding:
      position: 0
      prefix: '-g'
    doc: per gene statistics file (from `coverage_stats_single.py`)
  - id: raw_coverage
    type: File
    inputBinding:
      position: 0
      prefix: '-r'
    doc: >-
      annotated bed file with coverage data (generated from annotate_bed.sh /
      bedtools intersect)
  - id: per_base_coverage
    type: File?
    inputBinding:
      position: 0
      prefix: '-b'
    doc: >-
      Per-base coverage bed file from mosdepth. (Optional; if not submitted,
      plots displaying global coverage per chromosome will not be displayed)
  - id: snps
    type:
      - 'null'
      - File
      - type: array
        items: File
    inputBinding:
      position: 999
      prefix: '-s'
    doc: 'VCF(s) of known SNPs to check coverage of (optional; i.e. HGMD, ClinVar)'
  - id: threshold
    type: int?
    inputBinding:
      position: 0
      prefix: '-t'
    doc: >-
      threshold value defining sub-optimal coverage (optional; default if not
      given: 20)
  - id: sample_name
    type: string?
    inputBinding:
      position: 0
      prefix: '-n'
  - id: output
    type: string?
    inputBinding:
      position: 0
      prefix: '-o'
    doc: name for output report (optional; sample name will be used if not given)
  - id: panel
    type: File?
    inputBinding:
      position: 0
      prefix: '-p'
    doc: >-
      panel bed file used for initial annotation, name will be displayed in
      summary of report (optional)
  - id: limit
    type: int?
    inputBinding:
      position: 0
      prefix: '-l'
    doc: >-
      number of genes at which to limit including full gene plots, large numbers
      of genes may take a long time to generate the plots (optional)
  - id: summary
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-m'
    doc: >-
      boolean flag to add clinical report summary text in summary section,
      includes list of all genes with transcripts (optional; default False)
  - id: cores
    type: int?
    inputBinding:
      position: 0
      prefix: '--cores'
    doc: >-
      Number of CPU cores to utilise, for larger numbers of genes this will
      drastically reduce run time. If not given will use maximum available
outputs:
  - id: coverage_report_single
    type: File
    outputBinding:
      glob: |-
        ${
            if (inputs.prefix) {
              return inputs.prefix + '*_report.html'
            } else {
              return '*_report.html'
            }
        }
label: coverage_report_single
arguments:
  - position: 0
    prefix: '--thread'
    valueFrom: |-
      ${
          if(inputs.number_of_threads)
              return inputs.number_of_threads
          return runtime.cores
      }
requirements:
  - class: ResourceRequirement
    ramMin: 17000
    coresMin: 4
  - class: DockerRequirement
    dockerPull: 'ghcr.io/msk-access/athena:1.4.2'
  - class: InlineJavascriptRequirement
'dct:contributor':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:buehlere@mskcc.org'
        'foaf:name': Eric Buehler
    'foaf:name': Memorial Sloan Kettering Cancer Center
'dct:creator':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:buehlere@mskcc.org'
        'foaf:name': Eric Buehler
    'foaf:name': Memorial Sloan Kettering Cancer Center
