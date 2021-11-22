output "bashion_instance_id" {
    value = aws_instance.bashion.id
}


output "bashion_public_ip"{
    value = aws_instance.bashion.public_ip
}

output "bashion_private_ip" {
    value = aws_instance.bashion.private_ip
}

output "bashion_sg_id" {
    value = aws_security_group.bashion_sg.id
}

