# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
[markdownlint](https://dlaa.me/markdownlint/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.2.1] - 2022-01-07

### Added in 2.2.1

- `main.containerPorts`
- `main.containerSecurityContext.enabled`
- `main.containerSecurityContext.runAsNonRoot`
- `main.containerSecurityContext.runAsUser`
- `main.customStartupProbe`
- `main.schedulerName`
- `main.service.extraPorts`
- `main.service.ports`
- `main.startupProbe`

### Changed in 2.2.1

- Update to template
- `main.image.pullPolicy` default value

### Removed in 2.2.1

- `main.certManager`
- `main.containerSecurityContext.privileged`
- `main.podSecurityContext.runAsGroup`
- `main.podSecurityContext.runAsUser`
- `main.service.httpsPort`
- `main.service.port`

## [2.2.0] - 2021-12-17

### Removed in 2.2.0

- Deleted clusterrolebinding.yaml

## [2.1.0] - 2021-11-19

### Added in 2.1.0

- Added support for PodDisruptionBudget

## [2.0.0] - 2021-11-15

### Changed in 2.0.0

- Migrated to new structure in [template](https://github.com/Senzing/charts/tree/master/template)

## [1.0.1] - 2020-10-16

### Added in 1.0.1

1. Added annotations

## [0.2.0] - 2019-09-10

### Added in 0.2.0

1. Initial public version