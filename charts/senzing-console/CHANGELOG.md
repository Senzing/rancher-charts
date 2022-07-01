# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
[markdownlint](https://dlaa.me/markdownlint/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.3.1] - 2022-06-30

### Changed in 2.3.1

- Added support for `main.senzing.licenseStringBase64`

## [2.3.0] - 2022-06-10

### Added in 2.3.0

- `main.containerSecurityContext.enabled`
- `main.containerSecurityContext.runAsNonRoot`
- `main.containerSecurityContext.runAsUser`
- `main.customStartupProbe`
- `main.schedulerName`
- `main.startupProbe`

### Changed in 2.3.0

- In `horizontalpodscaler.yaml`: `labels`
- In `poddisruptionbudget.yaml`: `labels`, `matchLabels`
- In `role.yaml`: `labels`
- In `rolebinding.yaml`: `labels`, `name`
- In `service-account.yaml`: `name`
- Update to template
- `main.image.pullPolicy` default value
- `main.podsecurityContext.enabled` default value
- `rbacEnabled` to `rbac.enabled`
- `serviceAccount.create` to `serviceAccount.enabled`

### Removed in 2.3.0

- `ingress`
- `main.containerSecurityContext.privileged`
- `main.podSecurityContext.runAsGroup`
- `main.podSecurityContext.runAsUser`
- `service`
- ingress.yaml

## [2.2.0] - 2022-05-09

### Changed in 2.2.0

1. Support for senzingdata v3.0.0

## [2.1.1] - 2022-03-02

### Changed in 2.1.1

- Updated to senzing-common 1.0.2

## [2.1.0] - 2021-11-19

### Added in 2.1.0

- Added support for PodDisruptionBudget

## [2.0.0] - 2021-11-15

### Changed in 2.0.0

- Migrated to new structure in [template](https://github.com/Senzing/charts/tree/main/template)

## [1.2.0] - 2021-09-22

### Added in 1.2.0

1. Add support for:
   - `senzing.mountOptMicrosoft`
   - `senzing.mountOptIbm`

## [1.0.1] - 2021-07-21

### Added in 1.0.1

1. Support for `SENZING_ENGINE_CONFIGURATION_JSON`

## [1.0.0] - 2021-07-07
