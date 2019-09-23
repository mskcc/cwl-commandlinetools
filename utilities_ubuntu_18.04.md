# CWL and Dockerfile for running utilites from Ubuntu 18.04

## Version of tools in docker image \(/container/Dockerfile\)

| Tool | Version | Location |
| :--- | :--- | :--- |
| Ubuntu base image | 18.04 | - |

## CWL

* CWL specification 1.0
* Use example\_inputs\_toolname.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner gzip.cwl example_inputs_gzip.yaml
```

