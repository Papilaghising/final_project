provider "aws" {
    region = var.region
    default_tags {
        tags ={
        silo = "intern"
        project = "vpc-terraform"
        terraform = true
        owner = "papila.ghising"
        }
    }
}