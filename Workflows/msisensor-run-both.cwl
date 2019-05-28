#!/usr/bin/env cwl-runner

$namespaces:
  dct: http://purl.org/dc/terms/
  foaf: http://xmlns.com/foaf/0.1/
  doap: http://usefulinc.com/ns/doap#

cwlVersion: v1.0

class: Workflow
id: msisensor-run-both
requirements:
  StepInputExpressionRequirement: {} 
  MultipleInputFeatureRequirement: {}
  ScatterFeatureRequirement: {}
  SubworkflowFeatureRequirement: {}
  InlineJavascriptRequirement: {}

inputs:
  normal_bam:
    type: File
    secondaryFiles: [ ".bai" ] 
  tumor_bam:
    type: File
    secondaryFiles: [ ".bai" ] 
  output_prefix: string
  msi_file: File

outputs:
  msisensor_0.2_output:
    type: File
    outputSource: msisensor_0.2/output

  msisensor_0.6_output:
    type: File
    outputSource: msisensor_0.6/output

steps:
  msisensor_0.2:
    run: ../CommandLineTools/msisensor_0.2/msisensor-0.2.cwl
    in:
      output_prefix: output_prefix
      d: msi_file
      n: normal_bam
      t: tumor_bam
      o:
        valueFrom: ${ return inputs.output_prefix + "_0.2.txt"; }
    out: [ output ]

  msisensor_0.6:
    run: ../CommandLineTools/msisensor_0.6/msisensor-0.6.cwl
    in:
      output_prefix: output_prefix
      d: msi_file
      n: normal_bam
      t: tumor_bam
      o:
        valueFrom: ${ return inputs.output_prefix + "_0.6.txt"; }
    out: [ output ]
