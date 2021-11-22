module "bashion" {
    depends_on = [
        module.networking
    ]
    source = "./module/bashion"
    environment = var.environment
    image = var.bashion_ami
    i_type = var.bashion_instance_type
    subnet_id = module.networking.public_subnet_ids[1]
    vpc_id = module.networking.vpc_id
    bashion_key_saving_filename_with_path = "${path.module}/keys/${var.environment}/bashion_key_${var.environment}.pem" 
}

resource "aws_security_group_rule" "rds_sg" {
  type              = "ingress"
  from_port         = var.rds_port
  to_port           = var.rds_port
  protocol          = "tcp"
  cidr_blocks       = "${module.bashion.bashion_public_ip}/32"
  security_group_id = var.rds_security_id
}