# JOVIAL

[JOVIAL](https://github.com/ChileanVirtualObservatory/jovial.chivo.cl/) is a JupyterHub server over high-availability technologies used internally at the Chilean Virtual Observatory to process astronomical datasets.

## TL;DR;

```console
$ helm install jovial/
```

## Introduction

This chart bootstraps an JOVIAL deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites
  - Kubernetes 1.6+ with RBAC rules **enabled**

## Installing the Chart

To install the chart with the release name `jovial`:

```console
$ helm install --name jovial jovial/
```

The command deploys JOVIAL on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `jovial` deployment:

```console
$ helm delete jovial
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the JOVIAL chart and their default values.

Parameter | Description | Default
--- | --- | ---
`jovial.kubernetes.clusterDomain` | Domain of the kubernetes cluster | `cluster.local`

```console
$ helm install jovial/ --name jovial \
    --set jovial.kubernetes.clusterDomain=cluster.example.com
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
$ helm install jovial/ --name jovial -f values.yaml
```