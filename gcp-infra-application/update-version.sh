!/bin/bash
source infra/version.tfvars.json
echo $function_statement_file_input_processor
version="v1.0.4"
contents="$(jq --arg version "$version" '.versionConfig.function_statement_file_input_processor = $version' infra/version.tfvars.json)"
echo -E "$contents" > infra/version.tfvars.json
