resource "aws_elb" "test" {
  # Drata: Configure [aws_elb.access_logs.enabled] to ensure that security-relevant events are logged to detect malicious activity
  name = "test-lb-tf"
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  listener {
    instance_port     = 8000
    instance_protocol = "HTTPS"
    lb_port           = 80
    lb_protocol       = "HTTPS"
  }
}
