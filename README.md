# River's Home Lab

This repository contains the full configuration of a lightweight k3d environment with standard platform services configured.
This is forever WIP, as I use it to learn new tools and try new things, but feel free to use for yourself if you happen upon it.

## Setup
To populate necessary environment variables:
```bash
source .env
```

To install required tools:
```bash
scripts/install.sh
```

To start the cluster:
```bash
scripts/start.sh
```

When you are done teardown.sh can be used to stop the environment:
```bash
scripts/teardown.sh
```

## Details
Thats it! Now each app in the cluster will be reachable at `https://<app name>:8082`