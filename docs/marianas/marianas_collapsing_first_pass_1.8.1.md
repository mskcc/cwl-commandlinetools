# Collapsing First Pass v1.8.1

## Version of tools in docker image \(/container/Dockerfile\)

| Tool | Version | Location |
| :--- | :--- | :--- |
| java base image | 8 | - |
| Marianas | 1.8.1 | [https://github.com/juberpatel/Marianas/releases/download/v1.8.1/Marianas-1.8.1.jar](https://github.com/juberpatel/Marianas/releases/download/v1.8.1/Marianas-1.8.1.jar) |

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner marianas_first_pass.cwl example_inputs.yaml
```

