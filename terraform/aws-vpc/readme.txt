This sets up a new VPC in AWS with a DMZ, internet gateway, and private subnet(s) routed through NAT instance in the DMZ.

Prerequisites:
* AWS CLI installed and credentials configured (aws configure)
* Terraform installed (v1.0.6+)

Process:
* Adjust terraform.tvars appropriately
* Run "terraform apply"

Notes:
* Most regions have a, b, and c availability zones only.
* Some zones have only specific instance types available.
* The default route created with the VPC may be deleted. It is not associated with any subnet and is not the main route. It is not used for anything. It is unnamed, maybe "-".
* VPC_Name is user friendly, can have spaces and MiXed CaPs
* vpc-name is not user firendly, cannot have spaces, lowercase and "-" only recommended
* all CIDRs other than cidr-vpc must be mutually exclusive address spaces within cidr-vpc.