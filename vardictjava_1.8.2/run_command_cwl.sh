module load singularity/3.7.1
module load cwl/cwltool
cwltool \
	--cachedir /work/ci/vurals/access_related/vardictjava_1.8.2-2/tmp/cache  \
	--outdir /work/ci/vurals/access_related/vardictjava_1.8.2-2/myoutput \
	--tmpdir-prefix /work/ci/vurals/access_related/vardictjava_1.8.2-2/tmp/tmp \
	--singularity \
	--non-strict  vardict_workflow_single_sample.cwl example_inputs.yaml
