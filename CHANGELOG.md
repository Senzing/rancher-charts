# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
[markdownlint](https://dlaa.me/markdownlint/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2021-11-18

### Added in 1.1.0

- Added charts
  - swaggerapi-swagger-ui:2.0.0
- `template` directory to promote common structure among charts.
  Removed `helm-create-example` chart.

### Changed in 1.1.0

- Renamed charts

| Before            | After                     |
|-------------------|---------------------------|
| mysql-client      | arey-mysql-client         |
| kafka-test-client | confluentinc-cp-kafka     |
| mssql-tools       | microsoft-mssql-tools     |
| postgresql-client | senzing-postgresql-client |

- Chart updates:
  - arey-mysql-client:2.0.0
  - confluentinc-cp-kafka:2.0.0
  - microsoft-mssql-tools:2.0.0
  - phppgadmin:3.0.0
  - senzing-api-server:2.0.0
  - senzing-apt:2.0.0
  - senzing-base:2.0.0
  - senzing-common:1.0.1
  - senzing-configurator:2.0.0
  - senzing-console:2.0.0
  - senzing-entity-search-web-app:2.0.0
  - senzing-init-container:2.0.0
  - senzing-postgresql-client:2.0.0
  - senzing-redoer:2.0.0
  - senzing-stream-loader:2.0.0
  - senzing-stream-producer:2.0.0
  - senzing-yum:2.0.0

## [1.0.2] - 2021-11-03

### Added in 1.0.2

- Added charts
  - mssql-tools:1.0.0
  - senzing-apt:1.0.0
  - senzing-common:1.0.0
- Template directory as a guide

### Changed in 1.0.2

- Last release prior to migration to "template"
- Chart updates:
  - entity-search-web-app:1.2.1
  - resolver:1.3.0
  - senzing-api-server:1.3.0
  - senzing-apt:1.0.0
  - senzing-base:1.3.0
  - senzing-configurator:1.3.0
  - senzing-console:1.2.0
  - senzing-init-container:1.3.0
  - senzing-redoer:1.3.0
  - senzing-stream-loader:1.3.0
  - senzing-stream-producer:1.1.1
  - senzing-yum:1.2.0

## [1.0.1] - 2021-07-22

### Changed in 1.0.1

- Chart updates:
  - phppgadmin:2.0.0
  - resolver:1.2.1
  - senzing-api-server:1.2.1
  - senzing-base:1.2.1
  - senzing-configurator:1.2.1
  - senzing-console:1.0.1
  - senzing-debug:1.2.1
  - senzing-init-container:1.2.1
  - senzing-yum:1.1.6
- Migration to Helm 3 support
- Restructure chart directories to "flatten" them.

## [1.0.0] - 2021-07-02

### Added to 1.0.0

- Helm 2 versions.
