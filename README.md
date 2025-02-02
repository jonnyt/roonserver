# Roonserver

## About
---
Based on https://github.com/steefdebruijn

## Building
---

Needs to be built on ARM64 as the RoonServer package is only available for x86 architectures:

```bash
docker build . --platform=linux/amd64 --tag jonathont/roonserver
```
