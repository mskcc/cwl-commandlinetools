#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  - id: panel_bed
    type: File
    inputBinding:
      position: 0
      prefix: '-p'
    doc: >-
      Input panel bed file; must have ONLY the following 4 columns chromosome,
      start position, end position, gene/transcript
  - id: transcript_file
    type: File
    inputBinding:
      position: 0
      prefix: '-t'
    doc: >-
      Transcript annotation file, contains required gene and exon information.
      Must have ONLY the following 6 columns:

      chromosome, start, end, gene, transcript, exon
  - id: coverage_file
    type: File
    inputBinding:
      position: 0
      prefix: '-c'
    doc: Per base coverage file (output from mosdepth or similar)

outputs:
  classout:
    type: File
    outputSource: compile/compiled_class

requirements:
  SubworkflowFeatureRequirement: {}

steps:
  compile:
    run: athena_1.4.2/annotated_bed_1.4.2/annotated_bed.cwl
    in:
      panel_bed: panel_bed
      transcript_file: transcript_file
      coverage_file: coverage_file
        default: "Hello.java"
    out: [compiled_class]

  create-tar:
    in: []
    out: [tar_compressed_java_file]
    run:
      class: CommandLineTool
      requirements:
        InitialWorkDirRequirement:
          listing:
            - entryname: Hello.java
              entry: |
                public class Hello {
                  public static void main(String[] argv) {
                      System.out.println("Hello from Java");
                  }
                }
      inputs: []
      baseCommand: [tar, --create, --file=hello.tar, Hello.java]
      outputs:
        tar_compressed_java_file:
          type: File
          streamable: true
          outputBinding:
            glob: "hello.tar"