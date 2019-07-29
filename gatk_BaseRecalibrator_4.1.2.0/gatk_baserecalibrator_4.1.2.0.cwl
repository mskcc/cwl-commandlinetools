class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  foaf: 'http://xmlns.com/foaf/0.1/'
  edam: http://edamontology.org/
id: gatk_base_recalibrator_4_1_2_0
baseCommand:
  - gatk
inputs:
  - id: input
    type: File
    inputBinding:
      position: 3
      prefix: '--input'
    doc: BAM/SAM file containing reads
    secondaryFiles:
      - ^.bai
  - id: known_sites_1
    type: File
    inputBinding:
      position: 3
      prefix: '--known-sites'
    doc: >-
      One or more databases of known polymorphic sites used to exclude regions
      around known polymorphisms from analysis
    secondaryFiles:
      - .idx
  - id: reference
    type: File
    inputBinding:
      position: 3
      prefix: '--reference'
    doc: Reference sequence file
    secondaryFiles:
      - .fai
      - ^.dict
  - id: output_file_name
    type: string?
    inputBinding:
      position: 3
    doc: Output file name. Not Required
  - id: add_output_sam_program_record
    type: boolean?
    inputBinding:
      position: 10
      prefix: '--add-output-sam-program-record'
  - id: add_output_vcf_command_line
    type: boolean?
    inputBinding:
      position: 10
      prefix: '--add-output-vcf-command-line'
  - id: arguments_file
    type:
      - 'null'
      - type: array
        items: File
        inputBinding:
          position: 0
          prefix: '--arguments_file'
  - id: binary_tag_name
    type: string?
    inputBinding:
      position: 10
      prefix: '--binary-tag-name'
  - id: bqsr_baq_gap_open_penalty
    type: float?
    inputBinding:
      position: 10
      prefix: '--bqsr-baq-gap-open-penalty'
  - id: cloud-index-prefetch-buffer
    type: int?
    inputBinding:
      position: 10
      prefix: '--cloud-index-prefetch-buffer'
  - id: cloud_prefetch_buffer
    type: int?
    inputBinding:
      position: 10
      prefix: '--cloud-prefetch-buffer'
  - id: create_output_bam_index
    type: boolean?
    inputBinding:
      position: 10
      prefix: '--create-output-bam-index'
  - id: create_output_bam_md5
    type: boolean?
    inputBinding:
      position: 10
      prefix: '--create-output-bam-md5'
  - id: create_output_variant_index
    type: boolean?
    inputBinding:
      position: 10
      prefix: '--create-output-variant-index'
  - id: create_output_variant_md5
    type: boolean?
    inputBinding:
      position: 10
      prefix: '--create-output-variant-md5'
  - id: default_base_qualities
    type: int?
    inputBinding:
      position: 10
      prefix: '--default-base-qualities'
  - id: deletions_default_quality
    type: int?
    inputBinding:
      position: 10
      prefix: '--deletions-default-quality'
  - id: disable_bam_index_caching
    type: boolean?
    inputBinding:
      position: 10
      prefix: '--disable-bam-index-caching'
  - id: disable_read_filter
    type: string?
    inputBinding:
      position: 10
      prefix: '--disable-read-filter'
  - id: disable_sequence_dictionary_validation
    type: boolean?
    inputBinding:
      position: 10
      prefix: '--disable-sequence-dictionary-validation'
  - id: exclude_intervals
    type: string?
    inputBinding:
      position: 10
      prefix: '--exclude-intervals'
  - id: gatk_config_file
    type: File?
    inputBinding:
      position: 10
      prefix: '--gatk-config-file'
  - id: gcs_max_retries
    type: int?
    inputBinding:
      position: 10
      prefix: '--gcs-max-retries'
  - id: gcs_project_for_requester_pays
    type: string?
    inputBinding:
      position: 10
      prefix: '--gcs-project-for-requester-pays'
  - id: indels_context_size
    type: int?
    inputBinding:
      position: 10
      prefix: '--indels-context-size'
  - id: insertions_default_quality
    type: int?
    inputBinding:
      position: 10
      prefix: '--insertions-default-quality'
  - id: interval_exclusion_padding
    type: int?
    inputBinding:
      position: 10
      prefix: '--interval-exclusion-padding'
  - id: interval_merging_rule
    type: string?
    inputBinding:
      position: 10
      prefix: '--interval-merging-rule'
  - id: interval_padding
    type: string?
    inputBinding:
      position: 10
      prefix: '--interval-padding'
  - id: interval_set_rule
    type: string?
    inputBinding:
      position: 10
      prefix: '--interval-set-rule'
  - id: intervals
    type: string?
    inputBinding:
      position: 10
      prefix: '--intervals'
  - id: lenient
    type: boolean?
    inputBinding:
      position: 10
      prefix: '--lenient'
  - id: low_quality_tail
    type: int?
    inputBinding:
      position: 10
      prefix: '--low-quality-tail'
  - id: maximum_cycle_value
    type: int?
    inputBinding:
      position: 10
      prefix: '--maximum-cycle-value'
  - id: mismatches_context_size
    type: int?
    inputBinding:
      position: 10
      prefix: '--mismatches-context-size'
  - id: mismatches_default_quality
    type: int?
    inputBinding:
      position: 10
      prefix: '--mismatches-default-quality'
  - id: preserve_qscores_less_than
    type: int?
    inputBinding:
      position: 10
      prefix: '--preserve-qscores-less-than'
  - id: quantizing_levels
    type: int?
    inputBinding:
      position: 10
      prefix: '--quantizing-levels'
  - id: QUIET
    type: boolean?
    inputBinding:
      position: 10
      prefix: '--QUIET'
  - id: read_filter
    type: string?
    inputBinding:
      position: 10
      prefix: '--read-filter'
  - id: read_index
    type: string?
    inputBinding:
      position: 10
      prefix: '--read-index'
  - id: seconds_between_progress_updates
    type: float?
    inputBinding:
      position: 10
      prefix: '--seconds-between-progress-updates'
  - id: sequence_dictionary
    type: File?
    inputBinding:
      position: 10
      prefix: '--sequence-dictionary'
  - id: sites_only_vcf_output
    type: boolean?
    inputBinding:
      position: 10
      prefix: '--sites-only-vcf-output'
  - id: use_original_qualities
    type: boolean?
    inputBinding:
      position: 10
      prefix: '--use-original-qualities'
  - id: number_of_threads
    type: int?
  - id: memory_per_job
    type: int?
  - id: memory_overhead
    type: int?
  - id: known_sites_2
    type: File?
    inputBinding:
      position: 3
      prefix: '--known-sites'
    secondaryFiles:
      - .idx
outputs:
  - id: output
    type: File
    outputBinding:
      glob: |-
        ${
            if(inputs.output_file_name){
                return inputs.output_file_name
            } else {
                return inputs.input.basename.replace(/.bam/, '_bqsr.table')
            }
        }
#    outputBinding:
#      glob: '$(inputs.input.basename.replace(''.bam'', ''''))_bqsr.table'
label: gatk_base_recalibrator_4.1.2.0
arguments:
  - position: 0
    prefix: '--java-options'
    valueFrom: "${\n  if(inputs.memory_per_job && inputs.memory_overhead) {\n   \n    if(inputs.memory_per_job % 1000 == 0) {\n    \t\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      \n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\" \n    }\n  }\n  else if (inputs.memory_per_job && !inputs.memory_overhead){\n    \n    if(inputs.memory_per_job % 1000 == 0) {\n    \t\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      \n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\" \n    }\n  }\n  else if(!inputs.memory_per_job && inputs.memory_overhead){\n    \n    return \"-Xmx4G\"\n  }\n  else {\n    \n  \treturn \"-Xmx4G\"\n  }\n}"
  - position: 1
    prefix: ''
    separate: false
    valueFrom: BaseRecalibrator
  - position: 2
    prefix: '--tmp-dir'
    valueFrom: .
  - position: 2
    prefix: '--output'
    valueFrom: |-
      ${
          if(inputs.output_file_name){
              return inputs.output_file_name
          } else {
              return inputs.input.basename.replace(/.bam/, '_bqsr.table')
          }
      }
#   valueFrom: '$(inputs.input.basename.replace(''.bam'', ''''))_bqsr.table'
  - position: 2
    prefix: '--verbosity'
    valueFrom: INFO
requirements:
  - class: ResourceRequirement
    ramMin: 32000
    coresMin: 8
#     ramMin: "${\r  if(inputs.memory_per_job && inputs.memory_overhead) {\r   \r    return inputs.memory_per_job + inputs.memory_overhead\r  }\r  else if (inputs.memory_per_job && !inputs.memory_overhead){\r    \r   \treturn inputs.memory_per_job + 2000\r  }\r  else if(!inputs.memory_per_job && inputs.memory_overhead){\r    \r    return 8000 + inputs.memory_overhead\r  }\r  else {\r    \r  \treturn 8000 \r  }\r}"
#     coresMin: "${\r  if (inputs.number_of_threads) {\r    \r   \treturn inputs.number_of_threads \r  }\r  else {\r    \r    return 1\r  }\r}"
  - class: DockerRequirement
    dockerPull: 'broadinstitute/gatk:4.1.2.0'
  - class: InlineJavascriptRequirement
'dct:contributor':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:sumans@mskcc.org'
        'foaf:name': Shalabh Suman
    'foaf:name': Memorial Sloan Kettering Cancer Center
'dct:creator':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:sumans@mskcc.org'
        'foaf:name': Shalabh Suman
    'foaf:name': Memorial Sloan Kettering Cancer Center