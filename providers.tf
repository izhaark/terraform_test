terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = ">=5.99.0"
        }


        tls = {
            source = "hashicorp/tls"
            version = "4.0.4"
        }
    }
}

provider "aws" {
        region  = "us-east-1"  
}
 


provider "tls" {

}
   