The BED file containing regions of interest is first required to be annotated with gene, exon and coverage information prior to analysis. This may be done using BEDtools intersect, with a file containing transcript to gene and exon information, and then the per base coverage data. Currently, 100% overlap is required between coordinates in the panel bed file and the transcript annotation file, therefore you must ensure any added flank regions etc. are the same.

Included is a Python script (annotate_bed.py) to perform the required BED file annotation.

Expected inputs:
```
-p / --panel_bed : Input panel bed file; must have ONLY the following 4 columns chromosome, start position, end position, gene/transcript

-t / --transcript_file : Transcript annotation file, contains required gene and exon information. Must have ONLY the following 6 columns:
chromosome, start, end, gene, transcript, exon

-c / --coverage_file : Per base coverage file (output from mosdepth or similar)

-s / -chunk_size : (optional) nrows to split per-base coverage file for intersecting, with <16GB RAM can lead to bedtools intersect failing. Reccomended values: 16GB RAM -> 20000000; 8GB RAM -> 10000000

-n / --output_name : (optional) Prefix for naming output file, if not given will use name from per base coverage file
```

Example usage:
```
$ annotate_bed.py -p panel_bed_file.bed -t transcript_file.tsv -c {input_file}.per_base.bed
```
