PIPELINE_NAME=$1
YAML_FILE=$2
OUTPUT_NAME=$3

toil clean job-stores/$OUTPUT_NAME
cwltoil --singularity --logFile toil_log.log \
    --batchSystem lsf \
    --stats \
    --debug  \
    --disableCaching  \
    --preserve-environment PATH TMPDIR TOIL_LSF_ARGS SINGULARITY_PULLFOLDER PWD \
    --defaultMemory 8G  \
    --maxCores 16  \
    --maxDisk 128G  \
    --maxMemory 256G  \
    --not-strict  \
    --realTimeLogging  \
    --jobStore job-stores/$OUTPUT_NAME  \
    --workDir /scratch/cwl-runs/tmp \
    --outdir $OUTPUT_NAME $PIPELINE_NAME $YAML_FILE
