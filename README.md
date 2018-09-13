# fluentd-s3-elasticsearch

[![Build Status](https://travis-ci.org/GovTechSG/fluentd-s3-elasticsearch.svg?branch=master)](https://travis-ci.org/GovTechSG/fluentd-s3-elasticsearch)

This repository is an automated build job for a docker image containing fluentd service with a S3
and Elasticsearch plugins installed and ready to use as multiple `output_plugin`s.

## Plugins Available

- fluent-plugin-s3 [fluent/fluent-plugin-s3](https://github.com/fluent/fluent-plugin-s3)
- fluent-plugin-elasticsearch [uken/fluent-plugin-elasticsearch](https://github.com/uken/fluent-plugin-elasticsearch)

## Descriptions

### `latest`

Latest versions of both plugins

### `fluent-plugin-s3-elasticsearch`

Latest: `<FLUENTD-VERSION>-latest`
Canonical Tag: `<FLUENTD-VERSION>-<S3_PLUGIN_VERSION>-<ES_PLUGIN_VERSION>`

## Usage

### Running

```bash
docker run -v ${PWD}/fluent.conf:/fluentd/etc/fluent.conf -it govtechsg/fluentd-s3-elasticsearch:latest
```

### Available commands in container

Outputs fluentd and plugin versions

```bash
version-info
```

## License

Available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
