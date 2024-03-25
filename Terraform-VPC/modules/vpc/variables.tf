variable "vpc_cidr"{
    description = "CPC CIDR range"
    type = string

}

variable "subnet_cidr"{
    description = "subnet CIDRS"
    type = list(string)
}
variable "subnet_names"{
    description = "subnetnames"
    type = list(string)
    default = ["PublicSubnet1" , "PublicSubnet2"]
    


}