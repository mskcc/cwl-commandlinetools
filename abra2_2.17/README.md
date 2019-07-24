# CWL and Dockerfile for running ABRA2

## Version of tools in docker image (/container/Dockerfile)

| Tool	| Version	| Location	|
|---	|---	|---	|
| openjdk  	| 8  	|  -	|
| ABRA2  	| 2.17	|  https://github.com/mozack/abra2/releases/download/v2.19/abra2-2.17.jar	|

[![](https://images.microbadger.com/badges/version/mskcc/abra2:0.1.0.svg)](https://microbadger.com/images/mskcc/abra2:0.1.0 "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/mskcc/abra2:0.1.0.svg)](https://microbadger.com/images/mskcc/abra2:0.1.0 "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/license/mskcc/abra2:0.1.0.svg)](https://microbadger.com/images/mskcc/abra2:0.1.0 "Get your own license badge on microbadger.com")

## CWL

- CWL specification 1.0
- Use example_inputs.yaml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner abra2_2.17.cwl example_inputs.yaml
```
  
