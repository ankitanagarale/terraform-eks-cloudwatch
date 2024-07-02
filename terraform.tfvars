aws_access_key = ""
aws_secret_key = ""

region                   = ""
availability_zones_count = 2

backend_bucket = "databackup-terraform1"

project = "demo"

vpc_cidr         = "10.0.0.0/16"
subnet_cidr_bits = 8

eks_version = 1.29
addon_version = "v1.7.0-eksbuild.1"



time_periods = 10
evaluate_period=100
threshold_value=1

sns-email= "ankitanagarale1009@gmail.com"
