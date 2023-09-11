# AWS CheatSheet

- [AWS CheatSheet](#aws-cheatsheet)
  - [Links](#links)
  - [Identity](#identity)
    - [Determine User Identity](#determine-user-identity)
  - [Credential and Profile Details Retrieval](#credential-and-profile-details-retrieval)
  - [Decode Error messages](#decode-error-messages)
  - [S3](#s3)
    - [online example commands](#online-example-commands)
    - [sync between two s3 buckets](#sync-between-two-s3-buckets)
    - [recursive copy from s3 to local](#recursive-copy-from-s3-to-local)
    - [sync from s3 to local including deletes](#sync-from-s3-to-local-including-deletes)
    - [dry-run sync from s3 to local including deletes](#dry-run-sync-from-s3-to-local-including-deletes)
    - [dry-run sync from local to s3 including deletes](#dry-run-sync-from-local-to-s3-including-deletes)
    - [recursive delete with exclusions](#recursive-delete-with-exclusions)
    - [recursive copy with exclusions](#recursive-copy-with-exclusions)
    - [Enable and use S3 Transfer Acceleration](#enable-and-use-s3-transfer-acceleration)
  - [CloudFormation](#cloudformation)
    - [Identify which CloudFormation stack was used to deploy a role](#identify-which-cloudformation-stack-was-used-to-deploy-a-role)
    - [Identify which CloudFormation stack was used to deploy a managed policy](#identify-which-cloudformation-stack-was-used-to-deploy-a-managed-policy)
    - [Deploy a CloudFormation Stack](#deploy-a-cloudformation-stack)
    - [Monitor status of a cloudformation stack](#monitor-status-of-a-cloudformation-stack)
    - [Review template associated withe deployed CloudFormation stack](#review-template-associated-withe-deployed-cloudformation-stack)
    - [List all stack outputs deployed to an AWS Account](#list-all-stack-outputs-deployed-to-an-aws-account)
    - [Display policy created/updated by CloudFormation](#display-policy-createdupdated-by-cloudformation)
  - [Miscellaneous](#miscellaneous)
    - [Programmatically list all of the available actions for AWS services](#programmatically-list-all-of-the-available-actions-for-aws-services)
    - [Generate a yaml based report of security groups configured within an account in a specific region (required v2 of the aws cli)](#generate-a-yaml-based-report-of-security-groups-configured-within-an-account-in-a-specific-region-required-v2-of-the-aws-cli)
    - [Display yaml based listing of a specific security groups (requires v2 of the aws cli)](#display-yaml-based-listing-of-a-specific-security-groups-requires-v2-of-the-aws-cli)
    - [Display lambda policy in json format](#display-lambda-policy-in-json-format)
    - [Display lambda policy in yaml format](#display-lambda-policy-in-yaml-format)
    - [Display cloudtrail details](#display-cloudtrail-details)
    - [Identify Subnets configured within Lambdas](#identify-subnets-configured-within-lambdas)

## Links

- [AWS CLI with jq and Bash](https://medium.com/circuitpeople/aws-cli-with-jq-and-bash-9d54e2eabaf1)
- [Policy Evaluation Logic In AWS](https://blog.ine.com/policy-evaluation-logic-in-aws)

## Identity

### Determine User Identity

```zsh
aws sts get-caller-identity --profile ProfileName

{
    "UserId": "AIDASAMPLEUSERID",
    "Account": "1234567890123",
    "Arn": "arn:aws:sts::1234567890123:assumed-role/role_name/user_id"
}
```

## Credential and Profile Details Retrieval

```zsh
egrep -A5 -i '\[ProfileName' ~/.aws/credentials
egrep -A12 '^\[ProfileName' ~/.aws/custom_config_file
```

## Decode Error messages

```zsh
aws --profile profileName sts decode-authorization-message --encoded-message <encoded_message>
```

to make things "pretty" and readable the following alternative command could be executed:

```zsh
aws --profile profileName sts decode-authorization-message --encoded-message <encoded_message> | jq '.["DecodedMessage"]' | sed 's/\\\"/\"/g' | sed 's/^.\(.*\).$/\1/' | json2yaml
```

```zsh
aws --profile profileName sts decode-authorization-message --encoded-message <encoded_message> | jq '.["DecodedMessage"]' | sed 's/\\\"/\"/g' | sed 's/^.\(.*\).$/\1/' | jq .
```

## S3

### online example commands

- [S3 User - Guide Using S3 Commands](http://docs.aws.amazon.com/cli/latest/userguide/using-s3-commands.html)

### sync between two s3 buckets

```zsh
aws s3 sync s3://my-us-west-2-bucket s3://my-us-east-1-bucket --source-region us-west-2 --region us-east-1
```

### recursive copy from s3 to local

```zsh
aws s3 cp --recursive --profile ProfileName s3://my-us-west-2-bucket local-folder-name
```

### sync from s3 to local including deletes

```zsh
aws s3 sync --delete s3://my-us-east-1-bucket local-dir-name
aws s3 sync --delete --profile ProfileName s3://my-us-east-1-bucket local-dir-name
```

### dry-run sync from s3 to local including deletes

```zsh
aws s3 sync --dryrun --delete --profile ProfileName s3://my-us-east-1-bucket local-dir-name
```

### dry-run sync from local to s3 including deletes

```zsh
aws s3 sync --dryrun --delete --profile ProfileName local-dir-name s3://my-us-east-1-bucket local-dir-name
```

### recursive delete with exclusions

```zsh
aws s3 rm --dryrun --recursive --profile ProfileName s3://my-us-east-1-bucket local-dir-name --exclude ".git/*" --exclude ".DS_Store" --exclude ".idea/*" --exclude ".vscode/*" --exclude ".editorconfig" --exclude ".gitignore"
aws s3 rm --recursive --profile ProfileName s3://my-us-east-1-bucket local-dir-name --exclude ".git/*" --exclude ".DS_Store" --exclude ".idea/*" --exclude ".vscode/*" --exclude ".editorconfig" --exclude ".gitignore"

aws s3 rm --dryrun --recursive --profile ProfileName local-dir-name s3://my-us-east-1-bucket --exclude ".git/*" --exclude ".DS_Store" --exclude ".idea/*" --exclude ".vscode/*" --exclude ".editorconfig" --exclude ".gitignore"
aws s3 rm --recursive --profile ProfileName local-dir-name s3://my-us-east-1-bucket --exclude ".git/*" --exclude ".DS_Store" --exclude ".idea/*" --exclude ".vscode/*" --exclude ".editorconfig" --exclude ".gitignore"
```

### recursive copy with exclusions

```zsh
aws s3 cp --recursive --profile ProfileName s3://my-us-east-1-bucket/DirectoryName/ /Local/Path/To/Specific/DirectoryName --exclude ".git/*" --exclude ".DS_Store" --exclude ".idea/*" --exclude ".vscode/*" --exclude ".editorconfig" --exclude ".gitignore"
aws s3 cp --recursive --profile ProfileName /Local/Path/To/Specific/DirectoryName s3://my-us-east-1-bucket/DirectoryName/ --exclude ".git/*" --exclude ".DS_Store" --exclude ".idea/*" --exclude ".vscode/*" --exclude ".editorconfig" --exclude ".gitignore"
```

### Enable and use S3 Transfer Acceleration

Links

- [Enable Transfer Acceleration](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/enable-transfer-acceleration.html)
- [Transfer Acceleration Examples](https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration-examples.html)
- [S3 Config](https://docs.aws.amazon.com/cli/latest/topic/s3-config.html)

In their `~/.aws/config` file entry associated with the AWS profile that they are using to perform the sync they will need to add three S3 related lines:

```zsh
s3 =
    addressing_style = virtual
    use_accelerate_endpoint = true
```

So, for example, if in their `~/.aws/config` file they had chosen to name the profile they use to connect to the collaboration s3 bucket by the profile name of foo, then their `~/.aws/config` file entry for that profile would need to be updated to look something like this:

```zsh
[foo]
output = json
region = aws_region_code
s3 =
    addressing_style = virtual
    use_accelerate_endpoint = true
```

The sync command they use will need to look a bit different as well and will need to use an additional flag:

```zsh
aws s3 sync --profile aws_profile_name path_to_local_data_directory_to_sync s3://bucket_name/optional_keyname/ --endpoint-url https://aws_account_name.s3-accelerate.amazonaws.com
```

## CloudFormation

### Identify which CloudFormation stack was used to deploy a role

```zsh
aws cloudformation describe-stack-resources --physical-resource-id roleName --region aws_region_code --query 'StackResources[?ResourceType==`AWS::IAM::Role`].StackName'
```

### Identify which CloudFormation stack was used to deploy a managed policy

```zsh
aws cloudformation describe-stack-resources --physical-resource-id arn:aws:iam::111111111111:policy/policyName --region aws_region_code --query 'StackResources[?ResourceType==`AWS::IAM::ManagedPolicy`].StackName'
```

### Deploy a CloudFormation Stack

**Note:** The `capabilities` option is only necessary if you are creating IAM resources and the `parameter-overrides` is only necessary if you need to override any default values defined in the template or if parameter default values are not defined in the template.

```zsh
aws cloudformation deploy --template-file ./cloudformationTemplate.yaml \
--stack-name cloudFormationStackName \
--capabilities CAPABILITY_NAMED_IAM \
--parameter-overrides Key1=Value1 Key2=Value2
```

### Monitor status of a cloudformation stack

Clone Eric Hammonds [aws-cloudformation-stack-status](https://github.com/alestic/aws-cloudformation-stack-status) GitHub repo.  This is a `bash` script and is most useful when combined with the `--watch` option, which requires the `watch` command.

```zsh
aws-cloudformation-stack-status --profile awsProfileName --color --watch cloudFormationStackName
```

### Review template associated withe deployed CloudFormation stack

```zsh
aws cloudformation get-template --stack-name stackName | jq -r '.TemplateBody | fromjson'
```

### List all stack outputs deployed to an AWS Account

```zsh
aws cloudformation list-exports
```

### Display policy created/updated by CloudFormation

  If necessary identify the arn of the policy resource that you want to display by reviewing all the resources deployed via the CloudFormation stack:
  
  ```zsh
  aws cloudformation describe-stack-resources --stack-name cloudFormationStackName
  ```
  
  Then issue the following command to display the current default version of a policy:
  
  ```zsh
  aws iam get-policy-version --policy-arn arn:aws:iam::111111111111:policy/policyName --version-id $( aws iam get-policy --policy-arn arn:aws:iam::111111111111:policy/policyName --query Policy.DefaultVersionId | tr -d '"' ) --output yaml
  ```

  OR:
  
  ```zsh
  aws iam get-policy-version \
  --policy-arn arn:aws:iam::$( aws sts get-caller-identity --query Account | tr -d '"' ):policy/policy_name \
  --version-id $( aws iam get-policy --policy-arn arn:aws:iam::$( aws sts get-caller-identity --query Account | tr -d '"' ):policy/policy_name --query Policy.DefaultVersionId | tr -d '"' ) \
  --output yaml
  ```

## Miscellaneous

### Programmatically list all of the available actions for AWS services

```zsh
curl --header 'Connection: keep-alive' \
     --header 'Pragma: no-cache' \
     --header 'Cache-Control: no-cache' \
     --header 'Accept: */*' \
     --header 'Referer: https://awspolicygen.s3.amazonaws.com/policygen.html' \
     --header 'Accept-Language: en-US,en;q=0.9' \
     --silent \
     --compressed \
     'https://awspolicygen.s3.amazonaws.com/js/policies.js' |
    cut -d= -f2 |
    jq -r '.serviceMap[] | .StringPrefix as $prefix | .Actions[] | "\($prefix):\(.)"' |
    sort |
    uniq
```

### Generate a yaml based report of security groups configured within an account in a specific region (required v2 of the aws cli)

```zsh
aws ec2 describe-security-groups --region aws_region_code --output yaml
```

### Display yaml based listing of a specific security groups (requires v2 of the aws cli)

```zsh
aws ec2 describe-security-groups --group-ids sg-111d1e1d11b1d1b11 --region aws_region_code --output yaml
```

### Display lambda policy in json format

```zsh
aws lambda get-policy --function-name edb_s3_tagging --region aws_region_code | jq '.Policy | fromjson'
```

### Display lambda policy in yaml format

```zsh
aws lambda get-policy --function-name edb_s3_tagging --region aws_region_code | jq '.Policy | fromjson' | json2yaml
```

### Display cloudtrail details

```zsh
aws cloudtrail lookup-events --lookup-attributes AttributeKey=EventName,AttributeValue=PutBucketPolicy --region aws_region_code --start-time 2020-04-30T13:30:00-04:00 --end-time 2020-04-30T14:40:00-04:00 --query 'Events[*]' | jq -r '.[].CloudTrailEvent | fromjson'
```

### Identify Subnets configured within Lambdas

```zsh
aws lambda list-functions --function-version ALL --region aws_region_code --output json --query 'Functions[?VpcConfig!=`null` && VpcConfig.SubnetIds!=`[]`] | [].{Arn:FunctionArn, Subnets:VpcConfig.SubnetIds, SecurityGroups: VpcConfig.SecurityGroupIds}'
```
