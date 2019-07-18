# AWS CLI  CheatSheet
<hr>

## Identity

### Determine User Identity

```
aws sts get-caller-identity --profile ProfileName

{
    "UserId": "AROAJQABLZS4A3QDU576Q",
    "Account": "123456789012",
    "Arn": "arn:aws:sts::123456789012:assumed-role/role_name/user_id"
}
```

<hr>

## S3

### online example commands

* [S3 User - Guid Using S3 Commands](http://docs.aws.amazon.com/cli/latest/userguide/using-s3-commands.html)

### sync between two s3 buckets

```bash
aws s3 sync s3://my-us-west-2-bucket s3://my-us-east-1-bucket --source-region us-west-2 --region us-east-1
```

### recursive copy from s3 to local

```bash
aws s3 cp --recursive --profile ProfileName s3://my-us-west-2-bucket local-folder-name
```

### sync from s3 to local including deletes

```bash
aws s3 sync --delete s3://my-us-east-1-bucket local-dir-name
aws s3 sync --delete --profile ProfileName s3://my-us-east-1-bucket local-dir-name
```

### dry-run sync from s3 to local including deletes

```bash
aws s3 sync --dryrun --delete --profile ProfileName s3://my-us-east-1-bucket local-dir-name
```

### dry-run sync from local to s3 including deletes

```bash
aws s3 sync --dryrun --delete --profile ProfileName local-dir-name s3://my-us-east-1-bucket local-dir-name
```

### recursive delete with exclusions

```bash
aws s3 rm --dryrun --recursive --profile ProfileName s3://my-us-east-1-bucket local-dir-name --exclude ".git/*" --exclude ".DS_Store" --exclude ".idea/*" --exclude ".vscode/*" --exclude ".editorconfig" --exclude ".gitignore"
aws s3 rm --recursive --profile ProfileName s3://my-us-east-1-bucket local-dir-name --exclude ".git/*" --exclude ".DS_Store" --exclude ".idea/*" --exclude ".vscode/*" --exclude ".editorconfig" --exclude ".gitignore"

aws s3 rm --dryrun --recursive --profile ProfileName local-dir-name s3://my-us-east-1-bucket --exclude ".git/*" --exclude ".DS_Store" --exclude ".idea/*" --exclude ".vscode/*" --exclude ".editorconfig" --exclude ".gitignore"
aws s3 rm --recursive --profile ProfileName local-dir-name s3://my-us-east-1-bucket --exclude ".git/*" --exclude ".DS_Store" --exclude ".idea/*" --exclude ".vscode/*" --exclude ".editorconfig" --exclude ".gitignore"
```

### recursive copy with exclusions

```bash
aws s3 cp --recursive --profile ProfileName s3://my-us-east-1-bucket/DirectoryName/ /Local/Path/To/Specific/DirectoryName --exclude ".git/*" --exclude ".DS_Store" --exclude ".idea/*" --exclude ".vscode/*" --exclude ".editorconfig" --exclude ".gitignore"
aws s3 cp --recursive --profile ProfileName /Local/Path/To/Specific/DirectoryName s3://my-us-east-1-bucket/DirectoryName/ --exclude ".git/*" --exclude ".DS_Store" --exclude ".idea/*" --exclude ".vscode/*" --exclude ".editorconfig" --exclude ".gitignore"
```
