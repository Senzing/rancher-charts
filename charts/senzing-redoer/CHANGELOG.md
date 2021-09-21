# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
[markdownlint](https://dlaa.me/markdownlint/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.3.0] - 2021-09-21

### Added in 1.3.0

1. Add support for:
   - `senzing.azureConnectionString`
   - `senzing.azureFailureConnectionString`
   - `senzing.azureFailureQueueName`
   - `senzing.azureInfoConnectionString`
   - `senzing.azureInfoQueueName`
   - `senzing.azureQueueName`
   - `senzing.mountOptMicrosoft`

## [1.2.0] - 2021-05-05

### Changed in 1.2.0

1. Support for senzingdata v2.0.0

## [1.0.4] - 2021-04-19

### Added in 1.0.4

1. Fixed label indentation errors

## [1.0.3] - 2020-10-16

### Added in 1.0.3

1. Added annotations

## [1.0.2] - 2020-03-24

### Added in 1.0.2

1. Added support for the following environment variables:
    1. `SENZING_CONFIG_PATH`
    1. `SENZING_KAFKA_BOOTSTRAP_SERVER`
    1. `SENZING_KAFKA_FAILURE_BOOTSTRAP_SERVER`
    1. `SENZING_KAFKA_FAILURE_TOPIC`
    1. `SENZING_KAFKA_INFO_BOOTSTRAP_SERVER`
    1. `SENZING_KAFKA_INFO_TOPIC`
    1. `SENZING_KAFKA_REDO_GROUP`
    1. `SENZING_KAFKA_REDO_BOOTSTRAP_SERVER`
    1. `SENZING_KAFKA_REDO_TOPIC`
    1. `SENZING_RABBITMQ_DELIVERY_MODE`
    1. `SENZING_RABBITMQ_FAILURE_HOST`
    1. `SENZING_RABBITMQ_FAILURE_PASSWORD`
    1. `SENZING_RABBITMQ_FAILURE_QUEUE`
    1. `SENZING_RABBITMQ_FAILURE_USERNAME`
    1. `SENZING_RABBITMQ_HOST`
    1. `SENZING_RABBITMQ_INFO_HOST`
    1. `SENZING_RABBITMQ_INFO_PASSWORD`
    1. `SENZING_RABBITMQ_INFO_QUEUE`
    1. `SENZING_RABBITMQ_INFO_USERNAME`
    1. `SENZING_RABBITMQ_PASSWORD`
    1. `SENZING_RABBITMQ_PREFETCH_COUNT`
    1. `SENZING_RABBITMQ_REDO_HOST`
    1. `SENZING_RABBITMQ_REDO_PASSWORD`
    1. `SENZING_RABBITMQ_REDO_QUEUE`
    1. `SENZING_RABBITMQ_REDO_USERNAME`
    1. `SENZING_RABBITMQ_USERNAME`

## [1.0.1] - 2020-02-07

### Added in 1.0.1

1. Added `serviceAccountName`

## [1.0.0] - 2020-01-23

1. Initial chart
