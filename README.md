
# telemetry-ansible

A repository with the ansible code used for version checking across the HMRC webops platform.

## Requirements
- `botocore`
- `boto3`
- `ansible`

## Commands

```
aws-profile -p <aws profile> ansible-playbook playbook.yml

aws-profile -p webops-integration-engineer-RoleTelemetryEngineer ansible-playbook playbook.yml

aws-profile -p webops-development-engineer-RoleTelemetryEngineer ansible-playbook playbook.yml

aws-profile -p webops-qa-engineer-RoleTelemetryEngineer ansible-playbook playbook.yml
```


### License

This code is open source software licensed under the [Apache 2.0 License]("http://www.apache.org/licenses/LICENSE-2.0.html").
