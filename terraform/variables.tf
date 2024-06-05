variable "region" {
    description = "The AWS region"
    type = string
    default = ""
}

variable "access_key" {
    description = "My access key"
    type = string
    default = ""
}

variable "secret_key" {
    description = "My secret key"
    type = string
    default = ""
}

variable "instance_type" {
    description = "The type of instance to launch"
    type = string
    default = "t2.micro"
}

variable "tags" {
    description = "A map of tags to add to all resources"
    type = map(string)
    default = {
        Name = "Nginx-Instance"
        Owner = "Daria"
    }
}

variable "key_name" {
    description = "The name of the key pair to use"
    type = string
    default = "laptop-asus-home"
}