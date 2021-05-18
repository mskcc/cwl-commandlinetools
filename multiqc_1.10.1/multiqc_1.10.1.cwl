#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

doc: |
  Run multiqc on log files from supported bioinformatic tools.

requirements:
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing: |
      ${
        // script merges the inputs
        // into one array that fulfills the type
        // requirement for "listing", which is
        // "{type: array, items: [File, Directory]}"

        var qc_files_directory = inputs.qc_files_directory;
        var qc_list_of_dirs = inputs.qc_list_of_dirs;
        var qc_files_array = inputs.qc_files_array;
        var qc_files_array_of_array = inputs.qc_files_array_of_array;
        var output_array = [];

        if ( qc_files_array != null ){
          // Fix to allow single qc_file_array
          if (qc_files_array.length === undefined){
            output_array.push(qc_files_array)
          } else {
            for (var i=0; i<qc_files_array.length; i++){
              output_array.push(qc_files_array[i])
            }

          }
        }

        if ( qc_files_array_of_array != null ){
          for (var i=0; i<qc_files_array_of_array.length; i++){
            for (var ii=0; ii<qc_files_array_of_array[i].length; ii++){
              output_array.push(qc_files_array_of_array[i][ii])
            }
          }
        }

        if ( qc_files_directory != null ){
          for ( var i=0; i<qc_files_directory.listing.length; i++ ){
            output_array.push(qc_files_directory.listing[i]);
          }
        }

        if ( qc_list_of_dirs != null){
          for ( var i=0; i<qc_list_of_dirs.length; i++ ){
            for ( var ii=0; i<qc_list_of_dirs[i].listing.length; ii++ ){
              output_array.push(qc_list_of_dirs[i].listing[ii]);
            }
          }
        }

        return output_array
      }

hints:
  ResourceRequirement:
    coresMin: 1
    ramMin: 10000
  DockerRequirement:
    dockerPull: ghcr.io/msk-access/multiqc_1.10.1


baseCommand: ["multiqc"]
arguments:
  - valueFrom: --zip-data-dir
    position: 1
  - valueFrom: "'log_filesize_limit: 100000000'"
    position: 1
    prefix: --cl_config
  - valueFrom: $(runtime.outdir)
    position: 2
    prefix: --outdir
  - valueFrom: $(runtime.outdir)
    position: 4

inputs:
  qc_files_dir:
    doc: |
      qc files in a Directory
    type:
    - "null"
    - Directory
  qc_list_of_dirs:
    doc: |
      qc files in multiple directories
    type:
    - "null"
    - Directory[]
  qc_files_array:
    doc: |
      qc files which shall be part of the multiqc summary;
      optional, only one of qc_files_array or qc_files_array_of_array
      must be provided
    type:
      - "null"
      - File
      - type: array
        items: File
  qc_files_array_of_array:
    doc: |
      qc files which shall be part of the multiqc summary;
      optional, only one of qc_files_array or qc_files_array_of_array
      must be provided
    type:
      - "null"
      - type: array
        items:
          type: array
          items: File
  report_name:
    doc: name used for the html report and the corresponding zip file
    type: string
    default: multiqc_1.10.1
    inputBinding:
      prefix: --filename
      position: 3

outputs:
  multiqc_zip:
    type: File
    outputBinding:
      glob: $(inputs.report_name)_data.zip
  multiqc_html:
    type: File
    outputBinding:
      glob: $(inputs.report_name).html
  diree:
    type: Directory
    outputBinding:
      glob: .
#  multiqc_json:
#    type: File
#    outputBinding:
#      glob: multiqc_data/$(inputs.report_name).json
#
