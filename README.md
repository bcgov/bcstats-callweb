# bcstats-callweb

## GitOps

Four Environments are configured: `dev`, `test`, `prod` and `gateway`.

Go to https://github.com/bcgov/bcstats-callweb/settings/environments to configure the rules around which environments require approvals to proceed.

Dispatch requests come from a Github Action at https://github.com/bcgov-c/tenant-gitops-af9df1/blob/main/.github/workflows/main.yaml.

### Generating environment variables

Use the following script to generate the data that will reside in the Environment Secret `CONFIG`:

```
OPENSHIFT_NS_CONTEXT=100000000
echo '
import sys, random, string

def rando(len, choices):
  return "".join(random.choice(choices) for _ in range(len))

def rando_cred(len):
  return rando(len, string.ascii_uppercase + string.ascii_lowercase + string.digits)

def rando_s3(len):
  return rando(len, string.ascii_uppercase + string.digits)

tuples = [
    ("MINIO_ROOT_USER", rando_cred(6)),
    ("MINIO_ROOT_PASSWORD", rando_cred(10)),
    ("S3_ACCESS_KEY", rando_s3(16)),
    ("S3_SECRET_KEY", rando_s3(32)),
    ("DB_ROOT_PASSWORD", rando_cred(12)),
    ("DB_REPLICATION_PASSWORD", rando_cred(12)),
    ("DB_PASSWORD", rando_cred(12)),
    ("CTX_FS_GROUP", sys.argv[1]),
    ("CTX_RUN_AS_USER", sys.argv[1]),
]
for t,v in tuples:
  print("%s=%s\n" % (t, v))
' | python3 - $OPENSHIFT_NS_CONTEXT
```
