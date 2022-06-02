#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
inputs:
    panel_bed: File
    transcript_file: File
    coverage_file: File

outputs:
  annotated_bed
    type: File
    outputSource: annotate/annotated_bed
steps:
  annotate:
    run: ../athena/1.4.2/annotate_bed/annotate_bed.cwl
    in:
      panel_bed: panel_bed
      transcript_file: transcript_file
      coverage_file: coverage_file
    out: [annotated_bed]
