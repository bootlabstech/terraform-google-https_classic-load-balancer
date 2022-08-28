resource "google_compute_backend_service" "backend_service" {
  project               = var.project_id
  name                  = "${var.name}-backend-service"
  protocol              = var.protocol
  health_checks         = var.health_checks
  load_balancing_scheme = var.load_balancing_scheme
  backend {
    group = var.group
  }
}

resource "google_compute_global_forwarding_rule" "forwarding_rule" {
  project               = var.project_id
  name                  = "${var.name}-forwarding-rule"
  target                = google_compute_target_http_proxy.target-proxy.id
  ip_protocol           = var.ip_protocol
  load_balancing_scheme = var.load_balancing_scheme
  port_range            = var.port_range
  ip_address            = var.ip_address
  depends_on = [
    google_compute_target_http_proxy.target-proxy
  ]
}

resource "google_compute_target_http_proxy" "target-proxy" {
  project = var.project_id
  name    = "${var.name}-target-proxy"
  url_map = google_compute_url_map.url_map.id
  depends_on = [
    google_compute_url_map.url_map
  ]
}

resource "google_compute_url_map" "url_map" {
  project         = var.project_id
  name            = "${var.name}-url-map"
  default_service = google_compute_backend_service.backend_service.id
  depends_on = [
    google_compute_backend_service.backend_service
  ]
}