Run steampipe on Cloudshell. Notice that it installs in your home drive and must be executed with 'dot' steampipe.
1. `curl -s -L https://github.com/turbot/steampipe/releases/latest/download/steampipe_linux_amd64.tar.gz | tar -xzvf -`
1.  `./steampipe plugin install aws`
1. `curl -s -L https://github.com/turbot/steampipe/releases/latest/download/steampipe_linux_amd64.tar.gz | tar -xzvf - ; ./steampipe plugin install aws`

Select the number of available IPs from the private VPCs in a subnet
`select title,vpc_id,subnet_id,availability_zone,available_ip_address_count from aws_vpc_subnet where vpc_id='vpc-0ea80082460c43671' and lower(title) like '%private%' order by title;`

Use simple query to get CiDR for the subnet you want counts on.
`select owner_id,interface_type,count(interface_type) as count from aws_ec2_network_interface where private_ip_address <<= '10.121.16.0/22' group by owner_id,interface_type order by count desc`

List the accounts consuming IPs for a subnet  
`select  count(*) as count ,owner_id from aws_ec2_network_interface where private_ip_address :: cidr <<='10.121.36.0/22' group by owner_id order by count desc`  

List CiDRs for AWS regions
`select title,vpc_id,cidr_block,region from aws_vpc order by title,network(cidr_block)`

Get SG info for EC2 instances
`select title, subnet_id, sg ->> 'GroupId' as group_id, sg ->> 'GroupName' as group_name from aws_ec2_instance cross join jsonb_array_elements(security_groups) as sg where title ilike '%grid%' order by group_id;`

Select ingress rules for Security group
`select  group_name,  group_id,  cidr_ipv4,  from_port,  to_port,  description from aws_vpc_security_group_rule where not is_egress and group_id='sg-01fa35801a2f60211'`

`select group_name, group_id, cidr_ipv4, ip_protocol, from_port, to_port, referenced_group_id, description from aws_vpc_security_group_rule where not is_egress and (group_id='sg-03f5f9ea68823d309' or group_id='sg-01fa35801a2f60211' or group_id='sg-0dd5a1dfb022b4277' or group_id='sg-0cefb3b80c1acf76d' or group_id='sg-0f44739e908f29747' or group_id='sg-07b8ed836fc76501f') order by group_name,ip_protocol,from_port,network(cidr_ipv4)`

Count the number of available IPs for a region and account type. Table join
`select a1.vpc_id, a1.title, b2.title, b2.subnet_id, b2.cidr_block, b2.region, b2.availability_zone, available_ip_address_count, power(2, 32 - masklen(b2.cidr_block :: cidr)) -1 as raw_size from aws_vpc as a1, aws_vpc_subnet as b2 where a1.vpc_id=b2.vpc_id and a1.region='us-east-2' and a1.title='ProdDX' order by b2.title;`  

`select a1.vpc_id, a1.title as vpc_name, b2.title as subnet_name, b2.subnet_id, b2.cidr_block, b2.region, b2.availability_zone, available_ip_address_count, power(2, 32 - masklen(b2.cidr_block :: cidr)) -1 as raw_size from aws_vpc as a1, aws_vpc_subnet as b2 where a1.vpc_id=b2.vpc_id  order by a1.title,b2.title`

Show all secrets that haven't been rotated ever or in the past year.
`select name,created_date,last_accessed_date,rotation_enabled,last_rotated_date from aws_secretsmanager_secret where (last_rotated_date  <= now() - interval '1 year') or (created_date <= now() - interval '1 year' and last_rotated_date is NULL) order by last_accessed_date`

Which EC2 instances kave SG attached.
`select title as "Title", 'aws_ec2_instance' as "Type", arn as "ARN" from aws_ec2_instance, jsonb_array_elements(security_groups) as sg where  sg ->> 'GroupId' = 'sg-01fa35801a2f60211'`

Show which ENI has a SG ID attached.
`select title as "Title" from aws_ec2_network_interface, jsonb_array_elements(groups) as sg where  sg ->> 'GroupId' = 'sg-0898b210e6c40f816'`
```
+-----------------------------+------------------+-----------------------------------------------------------------+
| Title                       | Type             | ARN                                                             |
+-----------------------------+------------------+-----------------------------------------------------------------+
| gridrqpcfile2.aws.lilly.com | aws_ec2_instance | arn:aws:ec2:us-east-2:141402723018:instance/i-064168704a0c4f8c6 |
| gridrqmgr01.aws.lilly.com   | aws_ec2_instance | arn:aws:ec2:us-east-2:141402723018:instance/i-0d2c3b92139c16d37 |
+-----------------------------+------------------+-----------------------------------------------------------------+
```
Show all SG rules

`select group_name, group_id,  perm ->> 'FromPort' as from_port, perm ->> 'ToPort' as to_port, perm ->> 'IpProtocol' as ip_protocol, perm ->> 'IpRanges' as ip_ranges, perm ->> 'Ipv6Ranges' as ipv6_ranges, perm ->> 'UserIdGroupPairs' as user_id_group_pairs, perm ->> 'PrefixListIds' as prefix_list_ids from aws_vpc_security_group as sg cross join jsonb_array_elements(ip_permissions) as perm where group_name not like '%StackSet%' and perm ->> 'IpRanges' like '%40%' order by group_name, from_port, to_port`

Select the eni and display all the primary and secondary IP addresses.
`select pvt_ip_addr ->> 'PrivateIpAddress' as "IP Address",  pvt_ip_addr ->> 'Primary' as "Primary" from  aws_ec2_network_interface eni,  jsonb_array_elements(eni.private_ip_addresses) as pvt_ip_addr where  eni.network_interface_id = 'eni-072973760f351ec4f' order by   pvt_ip_addr ->> 'Primary' desc`

Here's a similar command to pull back the IPs for a specific account. Note: You must limit the scope of the command by running it in cloudshell logged into the account you want details on. Do not run this in the network account unless you qualify it more with a where clause.  
`select network_interface_id, description, pvt_ip_addr ->> 'PrivateIpAddress' as "IP Address",  pvt_ip_addr ->> 'Primary' as "Primary" from  aws_ec2_network_interface eni,  jsonb_array_elements(eni.private_ip_addresses) as pvt_ip_addr order by   pvt_ip_addr ->> 'Primary' desc`

Yet another command of the same thing as above two.  
`select network_interface_id,attached_instance_id, description, pvt_ip_addr ->> 'PrivateIpAddress' as "IP Address",  pvt_ip_addr ->> 'Primary' as "Primary" from  aws_ec2_network_interface eni,  jsonb_array_elements(eni.private_ip_addresses) as pvt_ip_addr order by   network_interface_id, pvt_ip_addr ->> 'Primary' desc`

Command to return all VPC CiDRs and their CiDR associations. Sort by CiDR.
`select cidr_block, cidr_assc ->> 'CidrBlock' as "cidr_block_assc" from aws_vpc, jsonb_array_elements(cidr_block_association_set) as cidr_assc order by network(cidr_block),network((cidr_assc ->> 'CidrBlock')::cidr)`

Craig's EBS volume report
`select account_id, region, sum(size) as total_size, volume_type,  title, count(title) as total_volumes from aws_ebs_volume group by title, account_id, region, volume_type order by title`