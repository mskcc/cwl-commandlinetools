#!/usr/bin/env cwl-runner

class: Workflow
cwlVersion: v1.0

requirements:
  InlineJavascriptRequirement: {}
  StepInputExpressionRequirement: {}
  SubworkflowFeatureRequirement: {}
  MultipleInputFeatureRequirement: {}
  ScatterFeatureRequirement: {}

inputs:
  facets_vcf:
    type: File
    secondaryFiles:
      - .gz

  bam_normal:
    type: File

  bam_tumor:
    type: File
 
  tumor_sample_name:
    type: string

outputs:

  snp_pileup_out:
    type: File
    outputSource: do_snp_pileup/output_file

  facets_png: 
    type: File[]?
    outputSource: do_facets/png_files

  facets_txt_purity:
    type: File?
    outputSource: do_facets/txt_files_purity

  facets_txt_hisens:
    type: File?
    outputSource: do_facets/txt_files_hisens

  facets_out_files:
    type: File[]?
    outputSource: do_facets/out_files

  facets_rdata:
    type: File[]?
    outputSource: do_facets/rdata_files

  facets_seg:
    type: File[]?
    outputSource: do_facets/seg_files

steps:
  do_snp_pileup:
    run: ../tools/snp-pileup/htstools-0.1.1.cwl
    in:
        vcf_file: facets_vcf
        bam_normal: bam_normal
        bam_tumor: bam_tumor
        output_file:
          valueFrom: ${ return inputs.bam_normal.basename.replace(".bam", "") + "_" + inputs.bam_tumor.basename.replace(".bam", "") + ".dat.gz"; }
    out: [ output_file ]

  do_facets:
    run: ../tools/facets/facets.doFacets-1.5.6.cwl
    in:
      genome:
        valueFrom: ${ return "hg19"; }
      counts_file: do_snp_pileup/output_file
      TAG:
        valueFrom: ${ return inputs.counts_file.basename.replace(".dat.gz", ""); }
      tumor_id: tumor_sample_name
      directory:
        valueFrom: ${ return "."; }
    out: [ png_files, txt_files_purity, txt_files_hisens, out_files, rdata_files, seg_files ]
