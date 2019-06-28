class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  foaf: 'http://xmlns.com/foaf/0.1/'
  sbg: 'https://www.sevenbridges.com/'
id: abra2_2_19
baseCommand:
  - java
inputs:
  - id: memory_per_job
    type: int?
    doc: Memory per job in megabytes
  - id: memory_overhead
    type: int?
    doc: Memory overhead per job in megabytes
  - id: number_of_threads
    type: int?
    inputBinding:
      position: 1001
      prefix: '--threads'
  - id: input_bams
    type: 'File[]'
    inputBinding:
      position: 0
      prefix: '--in'
      itemSeparator: ','
    doc: Required list of input sam or bam file (s) separated by comma
    secondaryFiles:
      - .bai
  - id: patient_id
    type: string
  - id: working_directory
    type: Directory
    inputBinding:
      position: 0
      prefix: '--tmpdir'
  - id: reference_fasta
    type: string
    inputBinding:
      position: 0
      prefix: '--ref'
    doc: Genome reference location
  - id: targets
    type: File
    inputBinding:
      position: 0
      prefix: '--targets'
  - id: kmer
    type: string?
    inputBinding:
      position: 0
      prefix: '--kmer'
  - id: mad
    type: int?
    inputBinding:
      position: 0
      prefix: '--mad'
  - id: soft_clip_contig
    type: string?
    inputBinding:
      position: 0
      prefix: '--sc'
    doc: >-
      Soft clip contig args
      [max_contigs,min_base_qual,frac_high_qual_bases,min_soft_clip_len]
      (default:16,13,80,15)
  - id: mmr
    type: float?
    inputBinding:
      position: 0
      prefix: '--mmr'
  - id: scoring_gap_alignments
    type: string?
    inputBinding:
      position: 0
      prefix: '--sga'
    doc: >-
      Scoring used for contig alignments(match,
      mismatch_penalty,gap_open_penalty,gap_extend_penalty) (default:8,32,48,1)
  - id: contig_anchor
    type: string?
    inputBinding:
      position: 0
      prefix: '--ca'
    doc: >-
      Contig anchor [M_bases_at_contig_edge,max_mismatches_near_edge]
      (default:10,2)
  - id: window_size
    type: string?
    inputBinding:
      position: 0
      prefix: '--ws'
    doc: |-
      Processing window size and overlap
      (size,overlap) (default: 400,200)
  - id: consensus_sequence
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--cons'
    doc: Use positional consensus sequence when aligning high quality soft clipping
  - id: out
    type: 'File[]?'
    inputBinding:
      position: 0
      prefix: '--out'
      itemSeparator: ','
    doc: Required list of output sam or bam file (s) separated by comma
  - id: ignore_bad_assembly
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--ignore-bad-assembly'
  - id: bam_index
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--index'
    doc: >-
      Enable BAM index generation when outputting sorted alignments (may require
      additonal memory)
outputs: []
label: abra2_2.19
arguments:
  - position: 0
    prefix: ''
    valueFrom: "${\n  if(inputs.memory_per_job && inputs.memory_overhead) {\n   \n    if(inputs.memory_per_job % 1000 == 0) {\n    \t\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      \n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\" \n    }\n  }\n  else if (inputs.memory_per_job && !inputs.memory_overhead){\n    \n    if(inputs.memory_per_job % 1000 == 0) {\n    \t\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      \n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\" \n    }\n  }\n  else if(!inputs.memory_per_job && inputs.memory_overhead){\n    \n    return \"-Xmx15G\"\n  }\n  else {\n    \n  \treturn \"-Xmx15G\"\n  }\n}"
  - position: 1
    prefix: '-jar'
    valueFrom: /usr/bin/abra2.jar
requirements:
  - class: ResourceRequirement
    ramMin: "${\r  if(inputs.memory_per_job && inputs.memory_overhead) {\r   \r    return inputs.memory_per_job + inputs.memory_overhead\r  }\r  else if (inputs.memory_per_job && !inputs.memory_overhead){\r    \r   \treturn inputs.memory_per_job + 2000\r  }\r  else if(!inputs.memory_per_job && inputs.memory_overhead){\r    \r    return 15000 + inputs.memory_overhead\r  }\r  else {\r    \r  \treturn 17000 \r  }\r}"
    coresMin: "${\r  if (inputs.number_of_threads) {\r    \r   \treturn inputs.number_of_threads \r  }\r  else {\r    \r    return 4\r  }\r}"
  - class: DockerRequirement
    dockerPull: 'mskcc/abra2:0.1.0'
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
    'doap:name': abra2
    'doap:revision': 2.19
  - class: 'doap:Version'
    'doap:name': cwl-wrapper
    'doap:revision': 1.0.0
