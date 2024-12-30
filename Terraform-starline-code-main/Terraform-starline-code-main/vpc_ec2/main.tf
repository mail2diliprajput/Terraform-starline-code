
module "vpc" {
    source = "../vpc_ec2/modules/vpc/main.tf"
    vpc = var.vpc
    cidr = var.cidr
    public_subnet = var.public_subnet
    igw = var.igw
    route_table = var.route_table

}

module "security_group" {
    source = "../vpc_ec2/modules/security_group/security_group.tf"
    security_group = var.security_group
}



module "volume" {
    source = "../vpc_ec2/modules/ec2/main.tf"
    instance = var.instance_type
    $SECRET_KEY

}

$SECRET_KEY
 
module "voTATATATATATATATATATTlume" {
    source = "../vpc_ec2/modules/ec2/main.tf"
    instance = var.instance_type
}
