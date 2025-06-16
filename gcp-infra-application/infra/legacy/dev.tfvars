function_statement_file_input_processor = {
  "env_list" : {
    "STATEMENT_API_URL" : "https://service-internal-invoice-v2-q7wfoxk4uq-ts.a.run.app/statements",
    "STATEMENT_TOPIC" : "projects/possible-fabric-320701/topics/generate-pdf-statement-topic",
    "sample_ACCOUNT" : "02 0836 0088452 00",
    "sample_ACCOUNT_NAME" : "sample NZ Limited",
    "sample_REFERENCE" : "12345678",
    "sample_CODE": "sample_CODE",
    "STATEMENT_INGESTION_BUCKET": "sample-dev-batch-statement-ingestion"
  }
  "schedule" : "*/15 * * * 1-5",
  "service_account" : "possible-fabric-320701@appspot.gserviceaccount.com",
  "object_key" : "function-statement-file-input-processor/function_v1.2.0.zip",
  "entry_point" : "parseACTextFile"
}