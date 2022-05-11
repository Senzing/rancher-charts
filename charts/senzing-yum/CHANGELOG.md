# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
[markdownlint](https://dlaa.me/markdownlint/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.2.0] - 2022-06-01

### Added in 2.2.0

- `main.containerSecurityContext.enabled`
- `main.containerSecurityContext.runAsNonRoot`
- `main.containerSecurityContext.runAsUser`
- `main.customStartupProbe`
- `main.schedulerName`
- `main.startupProbe`

### Changed in 2.2.0

- In `poddisruptionbudget.yaml`: `labels`, `matchLabels`
- In `role.yaml`: `labels`
- In `rolebinding.yaml`: `labels`, `name`
- In `service-account.yaml`: `name`
- Update to template
- `main.image.pullPolicy` default value
- `main.podsecurityContext.enabled` default value
- `rbac.create` to `rbac.enabled`
- `serviceAccount.create` to `serviceAccount.enabled`

### Removed in 2.2.0

- `ingress`
- `main.containerSecurityContext.privileged`
- `main.podSecurityContext.runAsGroup`
- `main.podSecurityContext.runAsUser`
- `service`

## [2.1.0] - 2021-11-19

### Added in 2.1.0

- Added support for PodDisruptionBudget

## [2.0.0] - 2021-11-15

### Changed in 2.0.0

- Migrated to new structure in [template](https://github.com/Senzing/charts/tree/master/template)

## [1.2.0] - 2021-09-22

### Added in 1.2.0

1. Support for `/opt/microsoft`

## [1.1.5] - 2021-04-19

### Added in 1.1.5

1. Fixed label indentation errors

## [1.1.4] - 2021-03-29

### Added in 1.1.4

1. Added indentation to senzing-yum labels

## [1.1.3] - 2020-10-16

### Added in 1.1.3

1. Added annotations

## [1.1.2] - 2020-02-07

### Added in 1.1.2

1. Added `serviceAccountName`

## [1.1.1] - 2019-10-08

1. Added `Role`, `RoleBinding`, and `ServiceAccount`.

## [1.1.0] - 2019-10-02

### Added in 1.1.0

1. Added `rbacEnabled`

## [1.0.0] - 2019-09-27

### Changed in 1.0.1

1. Updated "Standard suffix" in templates/deployment.yaml

## [0.1.0] - 2019-09-10

### Added in 0.1.0

1. Initial public version
