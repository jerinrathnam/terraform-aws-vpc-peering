## Introduction
This Terraform module for AWS VPC peering connection provides a streamlined and efficient way to establish peering connections between Virtual Private Clouds (VPCs) within the Amazon Web Services (AWS) ecosystem.

The AWS VPC peering connection allows secure communication and resource sharing between VPCs, enabling you to create a virtual network that spans multiple VPCs. With this Terraform module for VPC peering connection, you can automate the configuration and deployment of these connections, reducing manual effort and ensuring consistency across your infrastructure.

This Terraform module offers a simplified and reusable approach to set up VPC peering connections, abstracting away the complexities of manually configuring the necessary components. It provides a comprehensive set of configurable parameters that allow you to customize the peering connection based on your specific requirements.

By leveraging this Terraform module, you can define the VPC peering connection between two VPCs, configure the necessary route tables, and establish the required network connectivity with just a few lines of code. The module handles the creation of the peering connection request, acceptance, and the associated route table updates, simplifying the process and ensuring consistency across multiple peering connections.

Furthermore, the Terraform module supports best practices by allowing you to define tags and other settings to enhance security and manageability of the VPC peering connections. It also integrates seamlessly with other Terraform resources and modules, enabling you to build comprehensive and scalable infrastructure configurations.

## Usage

#### Example of create peering connection
```
  module "vpc-peering" {
    source = "jerinrathnam/vpc-peering/aws"

    name                = "my-vpc-peering"
    vpc_id              = "vpc-0123456789"
    peer_vpc_account_id = "093455584442"
    peer_vpc_id         = "vpc-9876543210"
    vpc_cidr_block      = "172.10.0.0/16"
  }
```

#### Example of Accepting peering connection
```
  module "vpc-peering" {
    source = "jerinrathnam/vpc-peering/aws"

    peering_side        = "Accepter"
    peering_id          = "pcx-048nf8f934rh"
    auto_accept         = true
    name                = "my-vpc-peering"
    vpc_id              = "vpc-0123456789"
    vpc_cidr_block      = "16.20.0.0/16"
  }
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Description

This module will create a peering connection and Add routes or Accepting peering connection...

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_vpc_peering_connection.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection) | resource |
| [aws_vpc_peering_connection_accepter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_accept"></a> [auto\_accept](#input\_auto\_accept) | Accept the peering (both VPCs need to be in the same AWS account and region). | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the peering connection | `string` | `null` | no |
| <a name="input_peer_region"></a> [peer\_region](#input\_peer\_region) | The region of the accepter VPC of the VPC Peering Connection. auto\_accept must be false, and use the aws\_vpc\_peering\_connection\_accepter to manage the accepter side. | `string` | `null` | no |
| <a name="input_peer_vpc_account_id"></a> [peer\_vpc\_account\_id](#input\_peer\_vpc\_account\_id) | The AWS account ID of the owner of the peer VPC | `string` | `null` | no |
| <a name="input_peer_vpc_id"></a> [peer\_vpc\_id](#input\_peer\_vpc\_id) | The ID of the VPC with which you are creating the VPC Peering Connection. | `string` | `null` | no |
| <a name="input_peering_id"></a> [peering\_id](#input\_peering\_id) | Peering connection id. Required only if 'peering\_side' is 'Accepter' | `string` | `null` | no |
| <a name="input_peering_side"></a> [peering\_side](#input\_peering\_side) | Enter whether the peering side is request or accept. valid values are 'Requester' and 'Accepter' | `string` | `"Requester"` | no |
| <a name="input_route_table_ids"></a> [route\_table\_ids](#input\_route\_table\_ids) | List of The IDs of the routing tables. If you want add routes all the tables in a vpc, just leave it | `list(string)` | `[]` | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | The destination CIDR block. | `string` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the requester VPC | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_peering_id"></a> [peering\_id](#output\_peering\_id) | Peering connection ID of the Requester or Accepter |


## Authors
Module is maintained by [Jerin Rathnam](https://github.com/jerinrathnam).

**LinkedIn:** _[Jerin Rathnam](https://www.linkedin.com/in/jerin-rathnam)_.

## License
Apache 2 Licensed. See [LICENSE](https://github.com/jerinrathnam/terraform-aws-vpc-peering/blob/master/LICENSE) for full details.