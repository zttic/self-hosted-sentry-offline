# self-hosted-sentry-offline
Self-hosted Sentry deployment in an air-gapped environment

## Prerequisites
- A computer with Internet access (for initial setup)
- An air-gapped computer (target deployment environment)

## Installation

### Build Images
Build Docker images following the [official tutorial](https://develop.sentry.dev/self-hosted/#getting-started) on an Internet-connected machine

### Export Images
```bash
./export_sentry_images.sh <path_to_docker_compose_file> <export_directory>
```

### Import Images
```bash
./import-images.sh <images_directory>
```

### Initialize Sentry in Air-Gapped Environment
```bash
./init <path_to_sentry_self_hosted_foler>
```

### Start Sentry Services
```bash
docker compose up --wait
```