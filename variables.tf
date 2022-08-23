#forwarding_rule
variable "ip_protocol" {
  type        = string
  description = "The IP protocol to which this rule applies.  Possible values are TCP, UDP, ESP, AH, SCTP, and ICMP."
}
variable "load_balancing_scheme" {
  type        = string
  description = "This signifies what the GlobalForwardingRule will be used.The value of INTERNAL_SELF_MANAGED means that this will be used for Internal Global HTTP(S) LB. The value of EXTERNAL means that this will be used for External Global Load Balancing (HTTP(S) LB, External TCP/UDP LB, SSL Proxy). The value of EXTERNAL_MANAGED means that this will be used for Global external HTTP(S) load balancers.  Possible values are EXTERNAL, EXTERNAL_MANAGED, and INTERNAL_SELF_MANAGED"
}
variable "port_range" {
  type        = string
  description = "This field is used along with the target field https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_forwarding_rule#port_range"
}
variable "ip_address" {
  type        = string
  description = "The IP address that this forwarding rule serves. When a client sends traffic to this IP address, the forwarding rule directs the traffic to the target that you specify in the forwarding rule"
}

#backend service
variable "protocol" {
  type        = string
  description = "The protocol this BackendService uses to communicate with backends.Possible values are HTTP, HTTPS, HTTP2, TCP, SSL, and GRPC"
}
variable "load_balancing_mode" {
  type        = string
  description = "Indicates whether the backend service will be used with internal or external load balancing. Possible values are EXTERNAL, INTERNAL_SELF_MANAGED, and EXTERNAL_MANAGED"
}
variable "group" {
  type        = string
  description = "The fully-qualified URL of an Instance Group or Network Endpoint Group resource"
}
variable "health_checks" {
  type        = string
  description = "The health_checks"
}