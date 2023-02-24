For pulling from the Artifactory registry, an `artifactory-pull` secret must be created first in each namespace `af9df1-dev`, `af9df1-test` and `af9df1-prod`:

> Note: The `imagePullSecret` will be automatically created and be named like `artifacts-pull-default-ziozbv` in `af9df1-tools`.

```
oc create secret docker-registry artifactory-pull \
    --docker-server=artifacts.developer.gov.bc.ca \
    --docker-username=$REG_USERNAME \
    --docker-password=$REG_PASSWORD \
    --docker-email=$REG_EMAIL
```
