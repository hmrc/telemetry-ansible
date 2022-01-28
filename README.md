# telemetry-ansible

[![Brought to you by Telemetry Team](https://img.shields.io/badge/MDTP-Telemetry-40D9C0?style=flat&labelColor=000000&logo=gov.uk)](https://confluence.tools.tax.service.gov.uk/display/TEL/Telemetry)

A repository containing Ansible playbooks for specific tickets which allows for automated checking of running instance
properties/state without having to SSH onto each box individually.

<!-- toc -->

- [Requirements](#requirements)
- [Commands](#commands)
- [License](#license)

<!-- tocstop -->

## Requirements
- `ansible`
- `aws-profile`
- `boto3`
- `botocore`

## Commands

```shell
aws-profile -p ${AWS_PROFILE} make run ticket=${TICKET}

aws-profile -p webops-integration-engineer-RoleTelemetryEngineer make run ticket=TEL-2906
```

## License

This code is open source software licensed under the [Apache 2.0 License]("http://www.apache.org/licenses/LICENSE-2.0.html").
