
resource "google_project_iam_custom_role" "application_deployment_role" {
  role_id     = "${var.prefix}_application_deployment"
  title       = "sample application deployment role"
  description = "Devops: application deployment"
  permissions = [
    "cloudfunctions.functions.get",
    "cloudfunctions.functions.getIamPolicy",
    "cloudfunctions.functions.create",
    "cloudfunctions.functions.delete",
    "cloudfunctions.functions.setIamPolicy",
    "cloudfunctions.functions.sourceCodeSet",
    "cloudfunctions.functions.update",
    "cloudscheduler.jobs.create",
    "cloudscheduler.jobs.delete",
    "cloudscheduler.jobs.enable",
    "cloudscheduler.jobs.pause",
    "cloudscheduler.jobs.update",
    "iam.serviceAccounts.actAs",
    "pubsub.subscriptions.create",
    "pubsub.subscriptions.delete",
    "pubsub.subscriptions.setIamPolicy",
    "pubsub.subscriptions.update",
    "pubsub.topics.attachSubscription",
    "pubsub.topics.create",
    "pubsub.topics.delete",
    "pubsub.topics.detachSubscription",
    "pubsub.topics.publish",
    "pubsub.topics.update",
    "pubsub.topics.updateTag",
    "pubsublite.reservations.attachTopic",
    "run.services.create",
    "run.services.delete",
    "run.services.setIamPolicy",
    "run.services.update",
    "serviceusage.services.disable",
    "serviceusage.services.enable",
    "storage.buckets.create",
    "storage.buckets.delete",
    "storage.objects.create",
    "storage.objects.delete",
    "storage.objects.get",
    "storage.objects.list",
    "storage.objects.update"
  ]
}

resource "google_project_iam_custom_role" "application_execution_role" {
  role_id     = "${var.prefix}_application_execution"
  title       = "sample application execution role"
  description = "Execution: application deployment"
  permissions = [
    "cloudfunctions.functions.call",
    "cloudfunctions.functions.get",
    "cloudfunctions.functions.getIamPolicy",
    "pubsub.topics.publish",
    "storage.objects.create",
    "storage.objects.delete",
    "storage.objects.get",
    "storage.objects.getIamPolicy",
    "storage.objects.list",
    "storage.objects.update",
    "documentai.processors.get",
    "documentai.processors.list",
    "documentai.processors.processBatch",
    "documentai.processors.processOnline",
    "cloudkms.cryptoKeyVersions.useToDecrypt",
    "resourcemanager.projects.get",
    "pubsub.snapshots.seek",
    "pubsub.subscriptions.consume",
    "pubsub.topics.attachSubscription",
    "iam.serviceAccounts.get",
    "iam.serviceAccounts.getAccessToken",
    "iam.serviceAccounts.getOpenIdToken",
    "iam.serviceAccounts.implicitDelegation",
    "iam.serviceAccounts.list",
    "iam.serviceAccounts.signBlob",
    "iam.serviceAccounts.signJwt"
  ]
}

resource "google_project_iam_custom_role" "tester_role" {
  role_id     = "${var.prefix}_TesterRole"
  title       = "Tester Custom Role"
  description = "The custom iam role for tester"
  permissions = [
    #viewer
    "storage.buckets.list",
    "storage.hmacKeys.get",
    "storage.hmacKeys.list",
    "resourcemanager.projects.get",
    "storage.objects.get",
    "storage.objects.list",
    #WRITE TO STORAGE BUCKET
    "storage.buckets.get",
    "storage.objects.create",
    "storage.objects.delete",
    "storage.objects.getIamPolicy",
    "storage.objects.setIamPolicy",
    "storage.objects.update",
    "storage.buckets.create",
    "storage.multipartUploads.create",
    "storage.multipartUploads.abort",
    "storage.multipartUploads.listParts",
    #function invoker
    "cloudfunctions.functions.invoke",
    #cloudrun
    "run.jobs.run",
    #logging
    "logging.buckets.get",
    "logging.buckets.list",
    "logging.exclusions.get",
    "logging.exclusions.list",
    "logging.logEntries.list",
    "logging.logMetrics.get",
    "logging.logMetrics.list",
    "logging.logServiceIndexes.list",
    "logging.logServices.list",
    "logging.logs.list",
    "logging.operations.get",
    "logging.operations.list",
    "logging.queries.create",
    "logging.queries.delete",
    "logging.queries.get",
    "logging.queries.list",
    "logging.queries.listShared",
    "logging.queries.update",
    "logging.sinks.get",
    "logging.sinks.list",
    "logging.usage.get",
    "logging.views.get",
    "logging.views.list",
    #cloud scheduler job run
    "cloudscheduler.jobs.run",
    "cloudscheduler.jobs.fullView",
    "serviceusage.services.get",
    "serviceusage.services.list"
  ]
}

resource "google_project_iam_custom_role" "developer_role" {
  role_id     = "${var.prefix}_DeveloperRole"
  title       = "Developer Custom Role"
  description = "The custom iam role for developers"
  permissions = [
    #viewer
    "storage.buckets.list",
    "storage.hmacKeys.get",
    "storage.hmacKeys.list",
    "resourcemanager.projects.get",
    "storage.objects.get",
    "storage.objects.list",
    #WRITE TO STORAGE BUCKET
    "storage.buckets.get",
    "storage.objects.create",
    "storage.objects.delete",
    "storage.objects.getIamPolicy",
    "storage.objects.setIamPolicy",
    "storage.objects.update",
    "storage.buckets.create",
    "storage.multipartUploads.create",
    "storage.multipartUploads.abort",
    "storage.multipartUploads.listParts",
    #function invoker
    "cloudfunctions.functions.invoke",
    #cloudrun
    "run.jobs.run",
    #deploy functions
    "cloudfunctions.functions.call",
    "cloudfunctions.functions.create",
    "cloudfunctions.functions.get",
    "cloudfunctions.functions.invoke",
    "cloudfunctions.functions.list",
    "cloudfunctions.functions.sourceCodeGet",
    "cloudfunctions.functions.sourceCodeSet",
    "cloudfunctions.functions.update",
    "cloudfunctions.operations.get",
    "cloudfunctions.operations.list",
    #logging
    "logging.buckets.get",
    "logging.buckets.list",
    "logging.exclusions.get",
    "logging.exclusions.list",
    "logging.logEntries.list",
    "logging.logMetrics.get",
    "logging.logMetrics.list",
    "logging.logServiceIndexes.list",
    "logging.logServices.list",
    "logging.logs.list",
    "logging.operations.get",
    "logging.operations.list",
    "logging.queries.create",
    "logging.queries.delete",
    "logging.queries.get",
    "logging.queries.list",
    "logging.queries.listShared",
    "logging.queries.update",
    "logging.sinks.get",
    "logging.sinks.list",
    "logging.usage.get",
    "logging.views.get",
    "logging.views.list",
    #cloud scheduler job run
    "cloudscheduler.jobs.run",
    "cloudscheduler.jobs.fullView",
    "serviceusage.services.get",
    "serviceusage.services.list"
  ]
}

resource "google_project_iam_custom_role" "sysadmin_role" {
  role_id     = "${var.prefix}_SysadminRole"
  title       = "Sysadmin Custom Role"
  description = "The custom iam role for sysadmin"
  permissions = [
    #viewer
    "storage.buckets.list",
    "storage.hmacKeys.get",
    "storage.hmacKeys.list",
    "resourcemanager.projects.get",
    "storage.objects.get",
    "storage.objects.list",
    #WRITE TO STORAGE BUCKET
    "storage.buckets.get",
    "storage.objects.create",
    "storage.objects.delete",
    "storage.objects.getIamPolicy",
    "storage.objects.setIamPolicy",
    "storage.objects.update",
    "storage.buckets.create",
    "storage.multipartUploads.create",
    "storage.multipartUploads.abort",
    "storage.multipartUploads.listParts",
    #function invoker
    "cloudfunctions.functions.invoke",
    #cloudrun
    "run.jobs.run",
    #deploy functions
    "cloudfunctions.functions.call",
    "cloudfunctions.functions.create",
    "cloudfunctions.functions.get",
    "cloudfunctions.functions.invoke",
    "cloudfunctions.functions.list",
    "cloudfunctions.functions.sourceCodeGet",
    "cloudfunctions.functions.sourceCodeSet",
    "cloudfunctions.functions.update",
    "cloudfunctions.operations.get",
    "cloudfunctions.operations.list",
    #delete bucket
    "storage.buckets.delete",
    #create SSM entries
    "secretmanager.versions.add",
    #logging
    "logging.buckets.get",
    "logging.buckets.list",
    "logging.exclusions.get",
    "logging.exclusions.list",
    "logging.logEntries.list",
    "logging.logMetrics.get",
    "logging.logMetrics.list",
    "logging.logServiceIndexes.list",
    "logging.logServices.list",
    "logging.logs.list",
    "logging.operations.get",
    "logging.operations.list",
    "logging.queries.create",
    "logging.queries.delete",
    "logging.queries.get",
    "logging.queries.list",
    "logging.queries.listShared",
    "logging.queries.update",
    "logging.sinks.get",
    "logging.sinks.list",
    "logging.usage.get",
    "logging.views.get",
    "logging.views.list",
    #cloud scheduler job run
    "cloudscheduler.jobs.run",
    "cloudscheduler.jobs.fullView",
    "serviceusage.services.get",
    "serviceusage.services.list"
  ]
}