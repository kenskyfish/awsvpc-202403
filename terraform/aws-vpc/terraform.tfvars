// private address space includes:
//   172.16.0.0 – 172.31.255.255
//   10.anything <- recommended, e.g. 10.73.0.0/16 for cidr-vpc
//   192.168.anything <- not recommended, commonly overlaps with home WiFi

// AMI to use for NAT varies by region. Search using string "amzn-ami-vpc-nat"

// Install terraform on Ubuntu 22
// wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
// echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
// sudo apt update && sudo apt install terraform

/* aws_region        = "ap-northeast-2"
aws_profile       = "frankfurt"                  <- configure this with "aws configure --profile profilenamehere"
aws_used_azs      = ["a", "c"]                   <- availability zones, typically a, b, and c
aws_dmz_az        = "a"                          <- availability zone to use as dmz, any one of aws_used_azs
nat_ami           = "ami-0e046f0c741e508db"      <- AMI in aws_region to use for NAT instance
nat_instance_type = "t3.micro"
VPC_Name          = "Pohang VPC"                 <- user freindly VPC name
vpc-name          = "pohang"                     <- official VPC name
cidr-vpc          = "172.30.0.0/16"              <- do not overlap IP space used elsewhere, avoid 192.168.*
cidr-dmz          = "172.30.240.0/20"            <- remaining are all subnets of cidr-vpc
cidr-a            = "172.30.0.0/20"
cidr-b            = "172.30.16.0/20"
cidr-c            = "172.30.32.0/20"
cidr-d            = "172.30.48.0/20"  */

// Stockholm example
// eu-north-1    ami-072517490bf2cf3a3    amzn-ami-vpc-nat-2018.03.0.20230807.0-x86_64-ebs
// eu-north-1    ami-0705384c0b33c194c    Ubuntu, 24.04 LTS, amd64 noble image build on 2024-04-23
aws_profile       = "stockholm"
aws_region        = "eu-north-1"
aws_keypair_name  = "stockholm-admin"
aws_used_azs      = ["a", "b", "c"]
aws_dmz_az        = "b"
nat_ami           = "ami-072517490bf2cf3a3"
vpn_ami           = "ami-0705384c0b33c194c"
test_ami          = "ami-0705384c0b33c194c"
nat_instance_type = "t3.micro"
vpn_instance_type = "t3.micro"
test_instance_type = "t3.micro"
VPC_Name          = "Ragnar VPC"
vpc-name          = "ragnarvpc"
cidr-vpc          = "10.63.0.0/16"
cidr-dmz          = "10.63.0.0/20"
cidr-a            = "10.63.16.0/20"
cidr-b            = "10.63.32.0/20"
cidr-c            = "10.63.48.0/20"

