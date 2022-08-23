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
}
resource "google_compute_target_http_proxy" "target-proxy" {
  project = var.project_id
  name    = "${var.name}-target-proxy"
  url_map = google_compute_url_map.url_map.id
}

resource "google_compute_url_map" "url_map" {
  project         = var.project_id
  name            = "${var.name}-url-map"
  default_service = google_compute_backend_service.backend_service.id
}

















# pipeline {
#     agent { label 'leap-uat-566026' }

#     stages {
#         stage('Build') {
#             steps {
#                 echo 'build lms'
#                 sh """
#                     pwd
# 					gcloud auth list
# 					gcloud auth print-access-token | docker login -u oauth2accesstoken --password-stdin https://asia.gcr.io
					
					
# 					gsutil cp gs://mgcluleagcs01/deployment/publicKey.txt publicKey.txt
#                     gsutil cp gs://mgcluleagcs01/deployment/server.key server.key	
                                       
#                     ls -la				
					
# 					cd lms
# 					gsutil cp gs://mgcluleagcs01/deployment/lms/.env .env
# 					cat .env
# 					gsutil cp gs://mgcluleagcs01/deployment/sa.json sa.json
# 					cp sa.json config/sa.json
# 					mkdir -p assets
# 					docker build -t cerouatlms .
# 					docker image tag cerouatlms:latest asia.gcr.io/leap-uat-566026/cerouatlms:1
# 					docker push asia.gcr.io/leap-uat-566026/cerouatlms:1
					
# 					cd ../masters
# 					gsutil cp gs://mgcluleagcs01/deployment/masters/.env .env
# 					cat .env
# 					docker build -t cerouatmasters .
# 					docker image tag cerouatmasters:latest asia.gcr.io/leap-uat-566026/cerouatmasters:1
# 					docker push asia.gcr.io/leap-uat-566026/cerouatmasters:1
					
# 					cd ../user-management
# 					gsutil cp gs://mgcluleagcs01/deployment/usermodule/.env .env
# 					cat .env
# 					docker build -t cerouatusermodule .
# 					docker image tag cerouatusermodule:latest asia.gcr.io/leap-uat-566026/cerouatusermodule:1
# 					docker push asia.gcr.io/leap-uat-566026/cerouatusermodule:1
                    
# 					cd ../customer-management
# 					gsutil cp gs://mgcluleagcs01/deployment/customermodule/.env .env
# 					cat .env
# 					gsutil cp gs://mgcluleagcs01/deployment/sa.json sa.json
# 					cp sa.json config/sa.json
# 					docker build -t cerouatcustomermodule .
# 					docker image tag cerouatcustomermodule:latest asia.gcr.io/leap-uat-566026/cerouatcustomermodule:1
# 					docker push asia.gcr.io/leap-uat-566026/cerouatcustomermodule:1
					
# 					cd ../react_admin
# 					gsutil cp gs://mgcluleagcs01/deployment/react_admin/.env .env
# 					cat .env					
# 					docker build -t cerouatadminui .
# 					docker image tag cerouatadminui:latest asia.gcr.io/leap-uat-566026/cerouatadminui:1
# 					docker push asia.gcr.io/leap-uat-566026/cerouatadminui:1
					
# 					cd ../react_user
# 					gsutil cp gs://mgcluleagcs01/deployment/react_user/.env .env
# 					cat .env
# 					docker build -t cerouatfrontendui .
# 					docker image tag cerouatfrontendui:latest asia.gcr.io/leap-uat-566026/cerouatfrontendui:1
# 					docker push asia.gcr.io/leap-uat-566026/cerouatfrontendui:1
					
# 					cd ../payments
# 					mkdir -p keys
# 					cp ../publicKey.txt keys/publicKey.txt
# 					cp ../server.key keys/server.key
# 					gsutil cp gs://mgcluleagcs01/deployment/payments/.env .env
# 					cat .env
# 					docker build -t cerouatpayments .
# 					docker image tag cerouatpayments:latest asia.gcr.io/leap-uat-566026/cerouatpayments:1
# 					docker push asia.gcr.io/leap-uat-566026/cerouatpayments:1
					
# 					cd ../blog
# 					docker build -t cerouatblog .
# 					docker image tag cerouatblog:latest asia.gcr.io/leap-uat-566026/cerouatblog:1
# 					docker push asia.gcr.io/leap-uat-566026/cerouatblog:1
#                 """
#             }
#         }
        
#     }
# }
