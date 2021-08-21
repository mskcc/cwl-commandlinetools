# MergeBamAlignment v4.1.8.0

## Version of tools in docker image

| Tool | Version | Location |
| :--- | :--- | :--- |
| gatk | 4.1.8.0 | broadinstitute/gatk:4.1.8.0 |

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner gatk_merge_bam_alignment_4.1.8.0.cwl example_inputs.yaml
```

### Usage

```bash
usage: gatk_merge_bam_alignment_4.1.8.0.cwl [-h]
                                            [--memory_per_job MEMORY_PER_JOB]
                                            [--memory_overhead MEMORY_OVERHEAD]
                                            [--number_of_threads NUMBER_OF_THREADS]
                                            --unmapped_bam UNMAPPED_BAM
                                            --reference REFERENCE
                                            [--output_file_name OUTPUT_FILE_NAME]
                                            [--add_mate_cigar]
                                            [--add_pg_tag_to_reads]
                                            [--aligned_bam ALIGNED_BAM]
                                            [--aligned_reads_only]
                                            [--aligner_proper_pair_flags]
                                            [--attributes_to_remove ATTRIBUTES_TO_REMOVE]
                                            [--attributes_to_retain ATTRIBUTES_TO_RETAIN]
                                            [--attributes_to_reverse ATTRIBUTES_TO_REVERSE]
                                            [--attributes_to_reverse_complement ATTRIBUTES_TO_REVERSE_COMPLEMENT]
                                            [--clip_adapters]
                                            [--clip_overlapping_reads]
                                            [--expected_orientations EXPECTED_ORIENTATIONS]
                                            [--hard_clip_overlapping_reads]
                                            [--include_secondary_alignments]
                                            [--is_bisulfite_sequence]
                                            [--jump_size JUMP_SIZE]
                                            [--matching_dictionary_tags MATCHING_DICTIONARY_TAGS]
                                            [--max_insertions_or_deletions MAX_INSERTIONS_OR_DELETIONS]
                                            [--min_unclipped_bases MIN_UNCLIPPED_BASES]
                                            [--paired_run]
                                            [--primary_alignment_strategy PRIMARY_ALIGNMENT_STRATEGY]
                                            [--read1_aligned_bam READ1_ALIGNED_BAM]
                                            [--read1_trim READ1_TRIM]
                                            [--read2_aligned_bam READ2_ALIGNED_BAM]
                                            [--read2_trim READ2_TRIM]
                                            [--sort_order SORT_ORDER]
                                            [--unmap_contaminant_reads]
                                            [--unmapped_read_strategy UNMAPPED_READ_STRATEGY]
                                            [--validation_stringency VALIDATION_STRINGENCY]
                                            [--create_index]
                                            [--create_md5_file]
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
  --unmapped_bam UNMAPPED_BAM
                        Original SAM or BAM file of unmapped reads, which must
                        be in queryname order. Reads MUST be unmapped.
                        Required.
  --reference REFERENCE
                        Reference sequence file. Required.
  --output_file_name OUTPUT_FILE_NAME
                        Merged SAM or BAM file to write to. Required.
  --add_mate_cigar      Adds the mate CIGAR tag (MC) if true, does not if
                        false. Default value: true. Possible values: {true,
                        false}
  --add_pg_tag_to_reads
                        Add PG tag to each read in a SAM or BAM Default value:
                        true. Possible values: {true, false}
  --aligned_bam ALIGNED_BAM
                        SAM or BAM file(s) with alignment data. This argument
                        may be specified 0 or more times. Default value: null.
                        Cannot be used in conjunction with argument(s)
                        READ1_ALIGNED_BAM (R1_ALIGNED) READ2_ALIGNED_BAM
                        (R2_ALIGNED)
  --aligned_reads_only  Whether to output only aligned reads. Default value:
                        false. Possible values: {true, false}
  --aligner_proper_pair_flags
                        Use the aligners idea of what a proper pair is rather
                        than computing in this program. Default value: false.
                        Possible values: {true, false}
  --attributes_to_remove ATTRIBUTES_TO_REMOVE
                        Attributes from the alignment record that should be
                        removed when merging. This overrides
                        ATTRIBUTES_TO_RETAIN if they share common tags. This
                        argument may be specified 0 or more times. Default
                        value: null.
  --attributes_to_retain ATTRIBUTES_TO_RETAIN
                        Reserved alignment attributes (tags starting with X,
                        Y, or Z) that should be brought over from the
                        alignment data when merging. This argument may be
                        specified 0 or more times. Default value: null.
  --attributes_to_reverse ATTRIBUTES_TO_REVERSE
                        Attributes on negative strand reads that need to be
                        reversed. This argument may be specified 0 or more
                        times. Default value: [OQ, U2].
  --attributes_to_reverse_complement ATTRIBUTES_TO_REVERSE_COMPLEMENT
                        Attributes on negative strand reads that need to be
                        reverse complemented. This argument may be specified 0
                        or more times. Default value: [E2, SQ].
  --clip_adapters       Whether to clip adapters where identified. Default
                        value: true. Possible values: {true, false}
  --clip_overlapping_reads
                        For paired reads, clip the 3' end of each read if
                        necessary so that it does not extend past the 5' end
                        of its mate. Clipping will be either soft or hard
                        clipping, depending on CLIP_OVERLAPPING_READS_OPERATOR
                        setting. Hard clipped bases and their qualities will
                        be stored in the XB and XQ tags respectively. Default
                        value: true. Possible values: {true, false}
  --expected_orientations EXPECTED_ORIENTATIONS
                        The expected orientation of proper read pairs.
                        Replaces JUMP_SIZE This argument may be specified 0 or
                        more times. Default value: null. Possible values: {FR,
                        RF, TANDEM} Cannot be used in conjunction with
                        argument(s) JUMP_SIZE (JUMP)
  --hard_clip_overlapping_reads
                        If true, hard clipping will be applied to overlapping
                        reads. By default, soft clipping is used. Default
                        value: false. Possible values: {true, false}
  --include_secondary_alignments
                        If false, do not write secondary alignments to output.
                        Default value: true. Possible values: {true, false}
  --is_bisulfite_sequence
                        Whether the lane is bisulfite sequence (used when
                        calculating the NM tag). Default value: false.
                        Possible values: {true, false}
  --jump_size JUMP_SIZE
                        The expected jump size (required if this is a jumping
                        library). Deprecated. Use EXPECTED_ORIENTATIONS
                        instead Default value: null. Cannot be used in
                        conjunction with argument(s) EXPECTED_ORIENTATIONS
                        (ORIENTATIONS)
  --matching_dictionary_tags MATCHING_DICTIONARY_TAGS
                        List of Sequence Records tags that must be equal (if
                        present) in the reference dictionary and in the
                        aligned file. Mismatching tags will cause an error if
                        in this list, and a warning otherwise. This argument
                        may be specified 0 or more times. Default value: [M5,
                        LN].
  --max_insertions_or_deletions MAX_INSERTIONS_OR_DELETIONS
                        The maximum number of insertions or deletions
                        permitted for an alignment to be included. Alignments
                        with more than this many insertions or deletions will
                        be ignored. Set to -1 to allow any number of
                        insertions or deletions. Default value: 1.
  --min_unclipped_bases MIN_UNCLIPPED_BASES
                        If UNMAP_CONTAMINANT_READS is set, require this many
                        unclipped bases or else the read will be marked as
                        contaminant. Default value: 32.
  --paired_run          DEPRECATED. This argument is ignored and will be
                        removed. Default value: true. Possible values: {true,
                        false}
  --primary_alignment_strategy PRIMARY_ALIGNMENT_STRATEGY
                        Strategy for selecting primary alignment when the
                        aligner has provided more than one alignment for a
                        pair or fragment, and none are marked as primary, more
                        than one is marked as primary, or the primary
                        alignment is filtered out for some reason. For all
                        strategies, ties are resolved arbitrarily. Default
                        value: BestMapq. BestMapq (Expects that multiple
                        alignments will be correlated with HI tag, and prefers
                        the pair of alignments with the largest MAPQ, in the
                        absence of a primary selected by the aligner.)
                        EarliestFragment (Prefers the alignment which maps the
                        earliest base in the read. Note that EarliestFragment
                        may not be used for paired reads.) BestEndMapq
                        (Appropriate for cases in which the aligner is not
                        pair-aware, and does not output the HI tag. It simply
                        picks the alignment for each end with the highest
                        MAPQ, and makes those alignments primary, regardless
                        of whether the two alignments make sense together.)
                        MostDistant (Appropriate for a non-pair-aware aligner.
                        Picks the alignment pair with the largest insert size.
                        If all alignments would be chimeric, it picks the
                        alignments for each end with the best MAPQ.)
  --read1_aligned_bam READ1_ALIGNED_BAM
                        SAM or BAM file(s) with alignment data from the first
                        read of a pair. This argument may be specified 0 or
                        more times. Default value: null. Cannot be used in
                        conjunction with argument(s) ALIGNED_BAM (ALIGNED)
  --read1_trim READ1_TRIM
                        The number of bases trimmed from the beginning of read
                        1 prior to alignment Default value: 0.
  --read2_aligned_bam READ2_ALIGNED_BAM
                        SAM or BAM file(s) with alignment data from the second
                        read of a pair. This argument may be specified 0 or
                        more times. Default value: null. Cannot be used in
                        conjunction with argument(s) ALIGNED_BAM (ALIGNED)
  --read2_trim READ2_TRIM
                        The number of bases trimmed from the beginning of read
                        2 prior to alignment Default value: 0.
  --sort_order SORT_ORDER
                        The order in which the merged reads should be output.
                        Default value: coordinate. Possible values: {unsorted,
                        queryname, coordinate, duplicate, unknown}
  --unmap_contaminant_reads
                        Detect reads originating from foreign organisms (e.g.
                        bacterial DNA in a non-bacterial sample),and unmap +
                        label those reads accordingly. Default value: false.
                        Possible values: {true, false}
  --unmapped_read_strategy UNMAPPED_READ_STRATEGY
                        How to deal with alignment information in reads that
                        are being unmapped (e.g. due to cross-species
                        contamination.) Currently ignored unless
                        UNMAP_CONTAMINANT_READS = true. Note that the
                        DO_NOT_CHANGE strategy will actually reset the cigar
                        and set the mapping quality on unmapped reads since
                        otherwisethe result will be an invalid record. To
                        force no change use the DO_NOT_CHANGE_INVALID
                        strategy. Default value: DO_NOT_CHANGE. Possible
                        values: {COPY_TO_TAG, DO_NOT_CHANGE,
                        DO_NOT_CHANGE_INVALID, MOVE_TO_TAG}
  --validation_stringency VALIDATION_STRINGENCY
                        Validation stringency for all SAM files read by this
                        program. Setting stringency to SILENT can improve
                        performance when processing a BAM file in which
                        variable-length data (read, qualities, tags) do not
                        otherwise need to be decoded. Default value: STRICT.
                        This option can be set to 'null' to clear the default
                        value. Possible values: {STRICT,LENIENT, SILENT}
  --create_index        Whether to create a BAM index when writing a
                        coordinate-sorted BAM file. Default value: false.
                        Possible values: {true, false}
  --create_md5_file     Whether to create an MD5 digest for any BAM or FASTQ
                        files created. Default value: false. Possible values:
                        {true, false}
```

