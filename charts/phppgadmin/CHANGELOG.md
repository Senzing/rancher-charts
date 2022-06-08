# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
[markdownlint](https://dlaa.me/markdownlint/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [3.3.0] - 2022-06-10

### Added in 3.3.0

- In `ingress.yaml`: `ingressClassName`
- `main.containerPorts`
- `main.containerSecurityContext.enabled`
- `main.containerSecurityContext.runAsNonRoot`
- `main.containerSecurityContext.runAsUser`
- `main.customStartupProbe`
- `main.schedulerName`
- `main.startupProbe`
- `service.extraPorts`

### Changed in 3.3.0

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

### Removed in 3.3.0

- `ingress.certManager`
- `main.containerSecurityContext.privileged`
- `main.podSecurityContext.runAsGroup`
- `main.podSecurityContext.runAsUser`
- configmap.yaml

## [3.2.1] - 2022-03-02

### Changed in 3.2.1

- Updated to senzing-common 1.0.2

## [3.2.0] - 2021-12-17

### Removed in 3.2.0

- Deleted clusterrolebinding.yaml

## [3.1.0] - 2021-11-19

### Added in 3.1.0

- Added support for PodDisruptionBudget

## [3.0.0] - 2021-11-15

### Changed in 3.0.0

- Migrated to new structure in [template](https://github.com/Senzing/charts/tree/master/template)

## [1.0.2] - 2021-06-24

### Changed in 1.0.2

1. Changed to `senzing/phppgadmin`

## [1.0.1] - 2020-10-15

### Added in 1.0.1

1. Added annotations

## [0.2.0] - 2019-09-10

### Added in 0.2.0

1. Initial public version
