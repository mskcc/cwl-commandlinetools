# v2.22

## Version of tools in docker image \(/container/Dockerfile\)

| Tool | Version | Location |
| :--- | :--- | :--- |
| openjdk | 8 | - |
| ABRA2 | 2.22 | [https://github.com/mozack/abra2/releases/download/v2.22/abra2-2.22.jar](https://github.com/mozack/abra2/releases/download/v2.22/abra2-2.22.jar) |

[![](https://images.microbadger.com/badges/version/mskcc/abra2:0.2.0.svg)](https://microbadger.com/images/mskcc/abra2:0.2.0) [![](https://images.microbadger.com/badges/image/mskcc/abra2:0.2.0.svg)](https://microbadger.com/images/mskcc/abra2:0.2.0) [![](https://images.microbadger.com/badges/license/mskcc/abra2:0.2.0.svg)](https://microbadger.com/images/mskcc/abra2:0.2.0)

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner abra2_2.22.cwl example_inputs.yaml
```

