#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
inputs:
    panel_bed: File
    transcript_file: File
    coverage_file: File
    


outputs:
  coverage_report_single:
    type: Directory
    outputSource: report/coverage_report_single

steps:
  annotate:
    run: ../athena/1.4.2/annotate_bed/annotate_bed.cwl
    in:
      panel_bed: panel_bed
      transcript_file: transcript_file
      coverage_file: coverage_file
    out: [annotated_bed]
  stats:
    run: ../athena/1.4.2/coverage_stats_single/coverage_stats_single.cwl
    in:
      file: annotate/annotated_bed/.*bed
    out: [single_stats_output]
  report:
    run: ../athena/1.4.2/coverage_report_single/coverage_report_single.cwl
    in:
      raw_coverage: stats/single_stats_output 
      gene_stats: stats/single_stats_output
      exon_stats: stats/single_stats_output 
    out: [coverage_report_single]
