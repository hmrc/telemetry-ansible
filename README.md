# telemetry-ansible

[![Brought to you by Telemetry Team](https://img.shields.io/badge/MDTP-Telemetry-40D9C0?style=flat&labelColor=000000&logo=gov.uk)](https://confluence.tools.tax.service.gov.uk/display/TEL/Telemetry)

A repository containing Ansible playbooks for specific tickets which allows for automated checking of running instance
properties/state without having to SSH onto each box individually.

## Table of Contents
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Commands](#commands)
- [License](#license)

<!-- END doctoc -->

## Prerequisites

For building locally, you will need:
* an active `AWS_PROFILE` for HMRC AWS account
* [Docker](https://docs.docker.com/get-started/) installed and running
* [Python v3](https://www.python.org/downloads/) installed via [mise](https://mise.jdx.dev/).

## Setup

```shell
mise run setup
```
## Commands

```shell
# Ensure you have AWS Credentials set appropriately for the account
# make run ticket=${TICKET} inventory=${INVENTORY}
# e.g.
mise run ansible --ticket TEL-2837 --inventory aws_ec2.yml --check
```

## License

This code is open source software licensed under the [Apache 2.0 License]("http://www.apache.org/licenses/LICENSE-2.0.html").
