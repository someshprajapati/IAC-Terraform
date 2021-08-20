data "aws_ip_ranges" "apac_ec2" {
  regions  = ["ap-south-1", "ap-east-1"]
  services = ["ec2"]
}

resource "aws_security_group" "from_apac" {
  name = "from_apac"

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = slice(data.aws_ip_ranges.apac_ec2.cidr_blocks, 0, 10)
  }
  tags = {
    CreateDate = data.aws_ip_ranges.apac_ec2.create_date
    SyncToken  = data.aws_ip_ranges.apac_ec2.sync_token
  }
}
