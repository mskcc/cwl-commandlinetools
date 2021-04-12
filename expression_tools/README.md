# CWL Expression tools

## Available tools

| Tool     | Description              |
| -------- | ------------------------ |
| put_in_dir.cwl | put the list of files into the same directory |

## CWL

- CWL specification 1.0
- Use example_inputs_toolname.yaml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner put_in_dir.cwl example_inputs_gzip.yaml
```
