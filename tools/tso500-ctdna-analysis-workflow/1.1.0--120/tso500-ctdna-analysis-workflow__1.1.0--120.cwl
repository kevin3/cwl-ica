cwlVersion: v1.1
class: CommandLineTool

# Extensions
$namespaces:
    s: https://schema.org/
    ilmn-tes: http://platform.illumina.com/rdf/ica/
$schemas:
  - https://schema.org/version/latest/schemaorg-current-http.rdf

# Metadata
s:author:
    class: s:Person
    s:name: Alexis Lucattini
    s:email: Alexis.Lucattini@umccr.org
    s:identifier: https://orcid.org/0000-0001-9754-647X

# ID/Docs
id: tso500-ctdna-analysis-workflow--1.1.0.120
label: tso500-ctdna-analysis-workflow v(1.1.0.120)
doc: |
    Runs the ctDNA analysis workflow v(1.1.0.120)

hints:
    ResourceRequirement:
        ilmn-tes:resources:
            tier: standard
            type: fpga
            size: medium
        coresMin: 16
        ramMin: 240000
    DockerRequirement:
        dockerPull: "239164580033.dkr.ecr.us-east-1.amazonaws.com/acadia-500-liquid-workflow-aws:ruo-1.1.0.120"
        #dockerPull: ubuntu:latest

requirements:
  SchemaDefRequirement:
    types:
      - $import: ../../../schemas/tso500-sample/1.0.0/tso500-sample__1.0.0.yaml
      - $import: ../../../schemas/fastq-list-row/1.0.0/fastq-list-row__1.0.0.yaml
      - $import: ../../../schemas/tso500-outputs-by-sample/1.0.0/tso500-outputs-by-sample__1.0.0.yaml
  InlineJavascriptRequirement:
    expressionLib:
      # Standard
      - var abs_path = function(rel_path) {
          /*
          Return the absolute path of a relative path
          */
          return runtime.outdir + "/" + rel_path;
        }
      # Paths to inbuilt files
      - var get_cromwell_path = function() {
          return "/opt/cromwell/cromwell.jar";
        }
      - var get_analysis_wdl_path = function() {
          return "/opt/illumina/wdl/AnalysisWorkflow.wdl";
        }
      # Paths to inline directories
      - var get_scratch_mount = function() {
          return "/scratch";
        }
      - var get_resources_dir = function() {
          return get_scratch_mount() + "/" + "resources";
        }
      - var get_analysis_dir = function() {
          return get_scratch_mount() + "/" + "analysis_workflow";
        }
      - var get_output_dir = function() {
          return inputs.output_dirname;
        }
      - var get_logs_intermediates_dir = function() {
          return get_analysis_dir() + "/" + "analysis_outputs"
        }
      - var get_logs_intermediates_output_dir = function() {
          return get_output_dir() + "/" + "analysis_outputs"
        }
      - var get_fastq_dir_path = function() {
          return "fastqs";
        }
      - var get_fastq_list_file_mounts = function(sample_id, sample_number, input_fastq_list_rows){
          /*
          Return a list of entry/entryname dicts to be mounted for a given sample
          */

          /*
          Initialise an array of dicts
          */
          var e_ext = [];

          /*
          Iterate through each fastq list row
          Mount each read1 file with the following nomenclature

          Note key-values are squished together otherwise yaml has a hissy-fit
          */

          for (var i = 0; i < input_fastq_list_rows.length; i++){
            /*
            Get the file objects
            */
            var read_1_file_obj = input_fastq_list_rows[i].read_1;
            var read_2_file_obj = input_fastq_list_rows[i].read_2;
            var lane = input_fastq_list_rows[i].lane;

            /*
            Set the basenames for each file
            */
            var read_1_base_name = sample_id + "_S" + String(sample_number) + "_L" + String(lane).padStart(3, '0') + "_R1_" + "001.fastq.gz";
            var read_2_base_name = sample_id + "_S" + String(sample_number) + "_L" + String(lane).padStart(3, '0') + "_R2_" + "001.fastq.gz";

            /*
            Set the mount points for each file
            */
            var read_1_mount_point = get_fastq_dir_path() + "/" + sample_id + "/" + read_1_base_name;
            var read_2_mount_point = get_fastq_dir_path() + "/" + sample_id + "/" + read_2_base_name;

            /*
            Extend list with read 1 and read 2 fastq file objects at the set mountpoints
            */
            e_ext = e_ext.concat([
              {
                "entryname":read_1_mount_point,
                "entry":read_1_file_obj
              },
              {
                "entryname":read_2_mount_point,
                "entry":read_2_file_obj
              }
            ]);
          }

          /*
          Return the list of mount points for this sample
          */
          return e_ext;
        }
      # Paths to inline files
      - var get_input_json_path = function() {
          return "input.json";
        }
      - var get_run_cromwell_script_path = function() {
          return "run_cromwell.sh";
        }
      # Paths to outputs
      - var get_dsdm_json_path = function() {
          return get_logs_intermediates_output_dir() + "/" + "Contamination" + "/" + "dsdm.json"
        }
      - var get_dragen_license_key_folder = function() {
          /*
          Returns the analysis folder
          */
          return "license";
        }
      - var get_dragen_license_instance_folder = function() {
          /*
          Returns the dragen license folder
          */
          return "/opt/instance-identity";
        }
      - var get_dragen_license_path = function() {
          /*
          Returns the file to the dragen license
          */
          return get_dragen_license_key_folder() + "/" + "dragen_license.txt";
        }
      # Miscell
      - var get_sample_ids = function() {
          /*
          Iterate through each item in the tso500_samples input and return the sample_id attribute
          */

          /*
          Initialise sample ids list
          */
          var sample_ids = []

          /*
          Iterate through inputs
          */
          for (var i=0; i < inputs.tso500_samples.length; i++){
            sample_ids.push(inputs.tso500_samples[i].sample_id);
          }

          /*
          Return joined as comma separated values
          */
          return sample_ids.join(",");
        }
      # Path contents
      - var get_input_json_content = function(){
          /*
          Create a json file based on inputs and then stringify
          */
          return JSON.stringify({
                   "AnalysisWorkflow.sampleIdentifiers":get_sample_ids(),
                   "AnalysisWorkflow.fastqFolder":abs_path(get_fastq_dir_path()),
                   "AnalysisWorkflow.dsdmFile":inputs.fastq_validation_dsdm.path,
                   "AnalysisWorkflow.analysisFolder":get_analysis_dir(),
                   "AnalysisWorkflow.logsIntermediatesFolder":get_logs_intermediates_dir(),
                   "AnalysisWorkflow.resourceFolder":get_resources_dir(),
                   "AnalysisWorkflow.dragenLicenseKeyFolder":abs_path(get_dragen_license_key_folder()),
                   "AnalysisWorkflow.dragenLicenseInstanceFolder":get_dragen_license_instance_folder()
                 });
        }
      - var get_run_cromwell_script_content = function() {
          return "#!/usr/bin/env bash\n" +
                 "# Set up to fail\n" +
                 "set -euo pipefail\n\n" +
                 "echo \"create analysis dirs\" 1>&2\n" +
                 "mkdir --parents \\\n" +
                 "  \"" + get_output_dir() + "\" \\\n" +
                 "  \"" + get_resources_dir() + "\" \\\n" +
                 "  \"" + get_analysis_dir() + "\"\n\n" +
                 "echo \"start copy resources dir to scratch mount\" 1>&2\n" +
                 "cp -r \"" + inputs.resources_dir.path + "/.\" \"" + get_resources_dir() + "/\"\n" +
                 "echo \"completed copy of resources dir\" 1>&2\n\n" +
                 "echo \"start analysis workflow task\" 1>&2\n" +
                 "java \\\n" +
                 "  -DLOG_MODE=pretty \\\n" +
                 "  -DLOG_LEVEL=INFO \\\n" +
                 "  -jar \"" + get_cromwell_path() + "\" \\\n" +
                 "  run \\\n" +
                 "    --inputs \"" + get_input_json_path() + "\" \\\n" +
                 "    \"" + get_analysis_wdl_path() + "\"\n" +
                 "echo \"end analysis workflow task\" 1>&2\n\n" +
                 "echo \"copying outputs to output dir\" 1>&2\n" +
                 "cp -r \"" + get_analysis_dir() + "/.\" \"" + get_output_dir() + "/\"\n" +
                 "echo \"completed copy of outputs\" 1>&2\n" +
                 "echo \"tarring up cromwell files\" 1>&2\n" +
                 "tar \\\n" +
                 "  --remove-files \\\n" +
                 "  --create \\\n" +
                 "  --gzip \\\n" +
                 "  --file \"cromwell-executions.tar.gz\" \\\n" +
                 "  \"cromwell-executions\"/\n" +
                 "echo \"completed tarring of cromwell files\" 1>&2\n";
        }
  InitialWorkDirRequirement:
    listing: |
      ${
        /*
        Initialise listing with input jsons and cromwell script and run folder files
        */
        var e = [
                  /*
                  Input json
                  */
                  {
                   "entryname": get_input_json_path(),
                   "entry": get_input_json_content()
                  },
                  /*
                  Cromwell script
                  */
                  {
                   "entryname": get_run_cromwell_script_path(),
                   "entry": get_run_cromwell_script_content()
                  }
                ];

        /*
        Check if dragen license is added
        */
        if ( inputs.dragen_license_key !== null ){
          e.push({
                    "entryname": get_dragen_license_path(),
                    "entry": inputs.dragen_license_key
                 });
        }

        /*
        Iterate through each tso500 sample and place fastq files under the sample_id folder
        */
        for (var i = 0; i < inputs.tso500_samples.length; i++){
          /*
          Extend the listing for each sample present
          First we must get matching fastq list rows as inputs
          */
          var sample_id = inputs.tso500_samples[i].sample_id;
          var sample_name = inputs.tso500_samples[i].sample_name;
          var sample_number = i + 1;

          /*
          Iterate over the input fastq list rows and match rgsm values to the sample_name of the tso500 sample
          */
          var input_fastq_list_rows = [];
          for (var j = 0; j < inputs.fastq_list_rows.length; j++){
            /*
            Append fastq list rows items with matching rgsm values
            */
            if (inputs.fastq_list_rows[j].rgsm === sample_name){
              /*
              Append fastq list row
              */
              input_fastq_list_rows.push(inputs.fastq_list_rows[j]);
            }
          }
          /*
          Now mount according to the sample id
          */
          e = e.concat(get_fastq_list_file_mounts(sample_id, sample_number, input_fastq_list_rows));
        }

        /*
        Return entries
        */
        return e;
      }

baseCommand: [ "bash" ]

arguments:
  # Run the cromwell script
  - valueFrom: "$(get_run_cromwell_script_path())"
    position: 1

inputs:
  tso500_samples:
    label: tso500 samples
    doc: |
      A list of tso500 samples each element has the following attributes:
      * sample_id
      * sample_type
      * pair_id
    type: ../../../schemas/tso500-sample/1.0.0/tso500-sample__1.0.0.yaml#tso500-sample[]
  fastq_list_rows:
    label: fastq list rows
    doc: |
      A list of fastq list rows where each element has the following attributes
      * rgid  # Not used
      * rgsm
      * rglb  # Not used
      * read_1
      * read_2
    type: ../../../schemas/fastq-list-row/1.0.0/fastq-list-row__1.0.0.yaml#fastq-list-row[]
  # Reference inputs
  resources_dir:
    # No input binding required, directory path is placed in input.json
    label: resources dir
    doc: |
      The directory of resources
    type: Directory
  fastq_validation_dsdm:
    # No input binding required, fastq validation dsdm path is placed in input.json
    label: fastq validation dsdm
    doc: |
      Output of demux workflow. Contains steps for each sample id to run
    type: File
  dragen_license_key:
    label: dragen license key
    doc: |
      File containing the dragen license
    type: File?
  output_dirname:
    label: output dirname
    doc: |
      Output directory name (optional)
    type: string?
    default: "analysis_workflow"

outputs:
  output_dir:
    label: output directory
    doc: |
      Output files
    type: Directory
    outputBinding:
      glob: "$(get_logs_intermediates_output_dir())"
  contamination_dsdm:
    label: contamination dsdm
    doc: |
      Contamination dsdm json, used as input for Reporting task
    type: File
    outputBinding:
      glob: "$(get_dsdm_json_path())"
  # Task directories
  # Each output is a step in the wdl task workflow
  align_collapse_fusion_caller_dir:
    label: align collapse fusion caller dir
    doc: |
      Intermediate output directory for align collapse fusion caller step
    type: Directory?
    outputBinding:
      glob: "$(get_logs_intermediates_output_dir())/AlignCollapseFusionCaller"
  annotation_dir:
    label: annotation dir
    doc: |
      Intermediate output directory for annotation step
    type: Directory?
    outputBinding:
      glob: "$(get_logs_intermediates_output_dir())/Annotation"
  cnv_caller_dir:
    label: cnv caller dir
    doc: |
      Intermediate output directory for cnv caller step
    type: Directory?
    outputBinding:
      glob: "$(get_logs_intermediates_output_dir())/CnvCaller"
  contamination_dir:
    label: contamination dir
    doc: |
      Intermediate output directory for contamination step
    type: Directory?
    outputBinding:
      glob: "$(get_logs_intermediates_output_dir())/Contamination"
  dna_fusion_filtering_dir:
    label: dna fusion filtering dir
    doc: |
      Intermediate output directory for dna fusion filtering step
    type: Directory?
    outputBinding:
      glob: "$(get_logs_intermediates_output_dir())/DnaFusionFiltering"
  dna_qc_metrics_dir:
    label: dna qc metrics dir
    doc: |
      Intermediate output directory for dna qc metrics step
    type: Directory?
    outputBinding:
      glob: "$(get_logs_intermediates_output_dir())/DnaQCMetrics"
  max_somatic_vaf_dir:
    label: max somatic vaf dir
    doc: |
      Intermediate output directory for max somatic vaf step
    type: Directory?
    outputBinding:
      glob: "$(get_logs_intermediates_output_dir())/MaxSomaticVaf"
  merged_annotation_dir:
    label: merged annotation dir
    doc: |
      Intermediate output directory for merged annotation step
    type: Directory?
    outputBinding:
      glob: "$(get_logs_intermediates_output_dir())/MergedAnnotation"
  msi_dir:
    label: msi dir
    doc: |
      Intermediate output directory for msi step
    type: Directory?
    outputBinding:
      glob: "$(get_logs_intermediates_output_dir())/Msi"
  phased_variants_dir:
    label: phased variants dir
    doc: |
      Intermediate output directory for phased variants step
    type: Directory?
    outputBinding:
      glob: "$(get_logs_intermediates_output_dir())/PhasedVariants"
  small_variant_filter_dir:
    label: small variant filter dir
    doc: |
      Intermediate output directory for small variants filter step
    type: Directory?
    outputBinding:
      glob: "$(get_logs_intermediates_output_dir())/SmallVariantFilter"
  stitched_realigned_dir:
    label: stitched realigned dir
    doc: |
      Intermediate output directory for stitched realigned step
    type: Directory?
    outputBinding:
      glob: "$(get_logs_intermediates_output_dir())/StitchedRealigned"
  tmb_dir:
    label: tmb dir
    doc: |
      Intermediate output directory for tmb step
    type: Directory?
    outputBinding:
      glob: "$(get_logs_intermediates_output_dir())/Tmb"
  variant_caller_dir:
    label: variant caller dir
    doc: |
      Intermediate output directory for variant caller step
    type: Directory?
    outputBinding:
      glob: "$(get_logs_intermediates_output_dir())/VariantCaller"
  variant_matching_dir:
    label: variant matching dir
    doc: |
      Intermediate output directory for variant matching step
    type: Directory?
    outputBinding:
      glob: "$(get_logs_intermediates_output_dir())/VariantMatching"

successCodes:
  - 0
