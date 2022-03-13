# Deployment of AWS resources for jbeardllc.com
module "jbeardllc_com_aws" {
    source = "github.com/joshbeard/tf-aws-site.git"

    domain      = "jbeardllc.com"
    bucket_name = "s3-website-jbeardllc-com"
    iam_name    = "s3-deployer-jbeardllc-com"
}

module "jbeardllc_com_migadu" {
    source = "github.com/joshbeard/tf-migadu-route53.git"

    domain        = "jbeardllc.com"
    zone_id       = module.jbeardllc_com_aws.zone_id
    migadu_verify = "kvjc7pvy"
}
