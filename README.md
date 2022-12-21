# bcstats-callweb

## GitOps

Four Environments are configured: `dev`, `test`, `prod` and `gateway`.

Go to https://github.com/bcgov/bcstats-callweb/settings/environments to configure the rules around which environments require approvals to proceed.

Dispatch requests come from a Github Action at https://github.com/bcgov-c/tenant-gitops-af9df1/blob/main/.github/workflows/main.yaml.
