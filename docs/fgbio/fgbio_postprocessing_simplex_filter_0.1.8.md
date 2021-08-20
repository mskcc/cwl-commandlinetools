# simplex\_filter v0.1.8

## Version of tools in docker image

| Tool | Version | Location |
| :--- | :--- | :--- |
| fgbio\_postprocessing | 0.1.8 | [https://github.com/msk-access/fgbio\_postprocessing](https://github.com/msk-access/fgbio_postprocessing) |

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner fgbio_postprocessing_simplex_filter_0.1.8.cwl example_inputs.yaml
```

## Usage

```bash
usage: fgbio_postprocessing_simplex_filter_0.1.8/fgbio_postprocessing_simplex_filter_0.1.8.cwl
       [-h] [--memory_per_job MEMORY_PER_JOB]
       [--memory_overhead MEMORY_OVERHEAD]
       [--number_of_threads NUMBER_OF_THREADS] --input_bam INPUT_BAM
       [--output_file_name OUTPUT_FILE_NAME]
       [job_order]

positional arguments:
  job_order             Job input json file

optional arguments:
  -h, --help            show this help message and exit
  --memory_per_job MEMORY_PER_JOB
                        Memory per job in megabytes
  --memory_overhead MEMORY_OVERHEAD
                        Memory overhead per job in megabytes
  --number_of_threads NUMBER_OF_THREADS
  --input_bam INPUT_BAM
                        Input file (bam or sam). Required.
  --output_file_name OUTPUT_FILE_NAME
                        Output file (bam or sam).
```

