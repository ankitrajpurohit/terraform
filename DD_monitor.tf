provider "datadog" {
  api_key   = "a299ddbcc0073d2fda2f9c40e930f765"
  app_key    = "ca1f7346daf084b864c7bcc4a8a3dd4255aa7378"
  datadog_url = "https://api.datadoghq.com"  # Optional, defaults to above URL
}
# Define the Datadog monitor resource
resource "datadog_monitor" "my_monitor" {
  name               = "My Custom Monitor"
  type               = "metric alert"  # Choose your monitor type (metric alert, event alert, etc.)
  query              = "avg:system.cpu.idle{host:webserver*} < 20"  # Your monitor query
  message            = "CPU utilization on web servers is low (below 20%)."
  escalation_policy  = "default"  # Optional, escalation policy ID
  tags               = ["webserver", "performance"]  # Optional, monitor tags
  notify_no_data     = false      # Optional, send notifications for missing data
  renotify_interval  = 1800       # Optional, re-notification interval in seconds
  silenced             = false      # Optional, start the monitor in a silenced state
  create_dashboard = false      # Optional, automatically create a dashboard
  critical_threshold = 10         # Optional (metric alert only), critical threshold
  warning_threshold  = 20         # Optional (metric alert only), warning threshold
  no_data_timeframe = 60          # Optional (metric alert only), no data timeframe in seconds
  maintenance_windows = []        # Optional (metric alert only), maintenance window configuration
  # Additional configuration options depend on the chosen monitor type
  # Refer to the Datadog provider documentation for details
}
