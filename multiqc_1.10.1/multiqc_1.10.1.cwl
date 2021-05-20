class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - multiqc
inputs:
  - id: qc_files_array
    type:
      - 'null'
      - File
      - type: array
        items: File
    doc: |
      qc files which shall be part of the multiqc summary;
      optional, only one of qc_files_array or qc_files_array_of_array
      must be provided
  - id: qc_files_array_of_array
    type:
      - 'null'
      - type: array
        items:
          items: File
          type: array
    doc: |
      qc files which shall be part of the multiqc summary;
      optional, only one of qc_files_array or qc_files_array_of_array
      must be provided
  - id: qc_files_dir
    type: Directory?
    doc: |
      qc files in a Directory
  - id: qc_list_of_dirs
    type: 'Directory[]?'
    doc: |
      qc files in multiple directories
  - default: multiqc_1.10.1
    id: report_name
    type: string
    inputBinding:
      position: 3
      prefix: '--filename'
    doc: name used for the html report and the corresponding zip file
  - id: config
    type: File?
    inputBinding:
      position: 0
      prefix: '--config'
outputs:
  - id: diree
    type: Directory
    outputBinding:
      glob: .
  - id: multiqc_html
    type: File
    outputBinding:
      glob: $(inputs.report_name).html
  - id: multiqc_zip
    type: File?
    outputBinding:
      glob: $(inputs.report_name)_data.zip
doc: |
  Run multiqc on log files from supported bioinformatic tools.
arguments:
  - position: 0
    valueFrom: .
requirements:
  - class: InitialWorkDirRequirement
    listing:
      - |
        ${
          // script merges the inputs
          // into one array that fulfills the type
          // requirement for "listing", which is
          // "{type: array, items: [File, Directory]}"

          var qc_files_directory = inputs.qc_files_dir;
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
              output_array = output_array.concat(qc_files_directory);
          }

          if ( qc_list_of_dirs != null ){
              for (var i=0; i<qc_list_of_dirs.length; i++){
                  output_array = output_array.concat(qc_list_of_dirs[i]);
              }
          }

          return output_array
        }
  - class: InlineJavascriptRequirement
hints:
  - class: ResourceRequirement
    ramMin: 10000
    coresMin: 1
  - class: DockerRequirement
    dockerPull: 'ghcr.io/msk-access/multiqc:v1.10.1.3'
