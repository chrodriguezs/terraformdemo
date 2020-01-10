terraform {
  backend "s3" {
    bucket = "demo-ene20-terraform"
    key    = "jenkins.terraform.tfstate"
    region = "eu-west-1"
  }
}