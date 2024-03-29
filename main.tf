terraform {
  required_providers {
    datadog = {
      source = "Datadog/datadog"
   }
  }
}


provider "datadog" {
  api_key   = "a299ddbcc0073d2fda2f9c40e930f765"
  app_key    = "ca1f7346daf084b864c7bcc4a8a3dd4255aa7378"
}
# Define the Datadog monitor resource
resource "datadog_monitor" "cpumonitortest" {
  name = "cpu monitor test"
  type = "metric alert"
  message = "CPU usage alert"
  query = "avg(last_1m):avg:system.cpu.system{*} by {host} > 60"
}
