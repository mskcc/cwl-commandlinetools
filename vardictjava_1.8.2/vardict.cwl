#!/usr/bin/env cwl-runner
cwlVersion: v1.0
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  doap: 'http://usefulinc.com/ns/doap#'
  foaf: 'http://xmlns.com/foaf/0.1/'
  sbg: 'https://www.sevenbridges.com/'
class: Workflow
id: vardict
label: vardict
requirements:
    MultipleInputFeatureRequirement: {}
    ScatterFeatureRequirement: {}
    SubworkflowFeatureRequirement: {}
    InlineJavascriptRequirement: {}
    StepInputExpressionRequirement: {}
inputs:
  bedfile:
    type: File?
  B:
    type: int?
  C:
    type: boolean?
  D:
    type: boolean?
  E:
    type: string?
  F:
    type: boolean?
  G:
    type: File
    secondaryFiles: ['.fai']
  H:
    type: boolean?
  I:
    type: string?
  J:
    type: boolean?
  K:
    type: boolean?
  L:
    type: string?
  M:
    type: string?
  N:
    type: string?
  N2:
    type: string?
  O:
    type: string?
  P:
    type: string?
  Q:
    type: string?
  R:
    type: string?
  S:
    type: string?
  T:
    type: string?
  U:
    type: string?
  UN:
    type: string?
  V:
    type: string?
  VS:
    type: string?
  W:
    type: string?
  X:
    type: string?
  Y:
    type: string?
  Z:
    type: string?

  a:
    type: string?
  b2:
    type: File?
    secondaryFiles: ['.bai']
  b:
    type: File?
    secondaryFiles: ['.bai']
  c:
    type: string?
  d:
    type: string?
  e:
    type: string?
  f:
    type: string?
  g:
    type: string?
  hh:
    type: boolean?
  i:
    type: boolean?
  j:
    type: string?
  k:
    type: string?
  m:
    type: string?
  n:
    type: string?
  o:
    type: string?
  p:
    type: boolean?
  q:
    type: string?
  r:
    type: string?
  s:
    type: string?
  t:
    type: boolean?
  th:
    type: string?
  x:
    type: string?
  z:
    type: string?
  vcf:
    type: string?
  f_1:
    type: string?
outputs:
  output:
    type: File
    outputSource: vardict_1/output
steps:
  vardict:
    run: ./vardict_app.cwl
    in:
      B: B
      C: C
      D: D
      E: E
      F: F
      G: G
      H: H
      I: I
      M: M
      N: N
      O: O
      P: P
      Q: Q
      R: R
      S: S
      T: T
      V: V
      VS: VS
      X: X
      Z: Z
      a: a
      b: b
      b2: b2
      bedfile: bedfile
      c: c
      d: d
      e: e
      f: f
      g: g
      h: hh
      i: i
      k: k
      m: m
      n: n
      o: o
      p: p
      q: q
      r: r
      t: t
      th: th
      v:
        valueFrom: ${ return inputs.vcf.replace(".vcf", "_tmp.vcf") }
      vcf: vcf
      x: x
      z: z
    out: [output]
  testsomatic:
    run: ./testsomatic.cwl
    in:
      input_vardict: vardict/output
    out: [output_var]
  vardict_1:
    run: ./var_to_vcf.cwl
    in:
      N: N
      N2: N2
      f: f_1
      vcf: vcf
      input_vcf: testsomatic/output_var
    out: [output]

'dct:contributor':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:vurals@mskcc.org'
        'foaf:name': Suleyman Vural
    'foaf:name': Memorial Sloan Kettering Cancer Center
'dct:creator':
  - class: 'foaf:Organization'
    'foaf:member':
      - class: 'foaf:Person'
        'foaf:mbox': 'mailto:kumarn1@mskcc.org'
        'foaf:name': Nikhil Kumar
    'foaf:name': Memorial Sloan Kettering Cancer Center
'doap:release':
  - class: 'doap:Version'
    'doap:name': Vardictjava
    'doap:revision': 1.8.2
