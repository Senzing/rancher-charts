# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
[markdownlint](https://dlaa.me/markdownlint/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.3.0] - 2022-06-10

### Added in 2.3.0

- In `ingress.yaml`: `ingressClassName`
- `main.containerPorts`
- `main.containerSecurityContext.enabled`
- `main.containerSecurityContext.runAsNonRoot`
- `main.containerSecurityContext.runAsUser`
- `main.customStartupProbe`
- `main.schedulerName`
- `main.startupProbe`
- `service.extraPorts`

### Changed in 2.3.0

- In `horizontalpodscaler.yaml`: `labels`
- In `ingress.yaml`: `labels`
- In `poddisruptionbudget.yaml`: `labels`, `matchLabels`
- In `role.yaml`: `labels`
- In `rolebinding.yaml`: `labels`, `name`
- In `service-account.yaml`: `name`
- Update to template
- `main.image.pullPolicy` default value
- `main.podsecurityContext.enabled` default value
- `rbac.create` to `rbac.enabled`
- `service.httpsPort` and `service.port` are now in `service.ports`
- `serviceAccount.create` to `serviceAccount.enabled`

### Removed in 2.3.0

- `ingress.certManager`
- `main.containerSecurityContext.privileged`
- `main.podSecurityContext.runAsGroup`
- `main.podSecurityContext.runAsUser`
- `main.senzing.webServerPort` - using `main.containerPorts.http` instead
- configmap.yaml

## [2.2.1] - 2022-03-02

### Changed in 2.2.1

- Updated to senzing-common 1.0.2

## [2.2.0] - 2021-12-17

### Removed in 2.2.0

- Deleted clusterrolebinding.yaml

## [2.1.0] - 2021-11-19

### Added in 2.1.0

- Added support for PodDisruptionBudget

## [2.0.0] - 2021-11-15

### Changed in 2.0.0

- Migrated to new structure in [template](https://github.com/Senzing/charts/tree/main/template)

## [1.2.1] - 2021-09-22

### Changed in 1.2.1

1. Remove unnecessary Persistent Volume Claim.

## [1.2.0] - 2021-05-05

### Changed in 1.2.0

1. Support for senzingdata v2.0.0

## [1.0.5] - 2021-04-19

### Added in 1.0.5

1. Fixed label indentation errors

## [1.0.4] - 2020-10-16

### Added in 1.0.4

1. Added annotations

## [1.0.2] - 2020-02-07

### Added in 1.0.2

1. Added `serviceAccountName`

## [1.0.1] - 2019-10-08

1. Added `Role`, `RoleBinding`, and `ServiceAccount`.

## [1.0.0] - 2019-08-04

1. Updated "Standard suffix" in templates/deployment.yaml

## [0.1.0] - 2019-09-10

### Added in 0.1.0

1. Initial public version
