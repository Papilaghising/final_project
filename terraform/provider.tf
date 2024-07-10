provider "aws" {
    region = var.region
    default_tags {
        tags ={
        silo = "intern"
        project = "vpc-terraform" #laravel
        terraform = true
        owner = "papila.ghising"
        }
    }
}