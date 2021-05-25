# MarkDuplicates v1.96

## Version of tools in docker image \(/container/Dockerfile\)

| Tool | Version | Location |
| :--- | :--- | :--- |
| java base image | 8 | - |
| picard | 1.96 | [https://sourceforge.net/projects/picard/files/picard-tools/1.96/picard-tools-1.96.zip](https://sourceforge.net/projects/picard/files/picard-tools/1.96/picard-tools-1.96.zip) |
| R | 3.3.3 | r-base for opnejdk:8 |

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner picard_mark_duplicates_1.96.cwl example_inputs.yaml
```

