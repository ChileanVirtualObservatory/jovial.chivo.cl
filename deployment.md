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
  - A NFS server where users homes are stored
  - A LDAP server where users information is stored

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
--- | --- | ----
`k8s.domain` | Internal domain of the kubernetes cluster. | `cluster.local`
`k8s.deploy.replicas` | Number of replicas for the hub server. | `3`
`k8s.deploy.minAvailable` | Minimal number of replicas available for the hub server. | `2`
`k8s.deploy.image` | Docker image for the hub server. | `docker.chivo.cl/jovial/hub:latest`
`k8s.deploy.ports.frontend` | Port where the hub server will serve the browser content. | `8000`
`k8s.deploy.ports.proxy` | Port where the hub server will serve the proxy api. | `8001`
`k8s.deploy.ports.rest` | Port where the hub server will serve the rest api. | `8081`
`k8s.ingress.enabled` | Should this chart create an ingress resource? | `true`
`k8s.ingress.domain` | Domain of the ingress resource that will route to JOVIAL. | `jovial.example.com`
`users.home.nfs.server` | Address of the NFS server where users homes are stored. | `nfs.example.com`
`users.home.nfs.path` | Path in the NFS server where users homes are stored. | `/exports/users`
`users.ldap.address` | Address of the LDAP server where users information is stored. | `ldap.example.com`
`users.ldap.port` | Port of the LDAP server where users information is stored. | `389`
`users.ldap.ssl.enabled` | Should the LDAP authenticator of the hub use SSL to talk with the LDAP server? | `true`
`users.ldap.ssl.CACert` | CA certificate of the LDAP server. If `users.ldap.ssl.enabled` is `false` this setting is ignored | `...`
`users.ldap.ssl.clientCert` | Certificate of the LDAP client. If `users.ldap.ssl.enabled` is `false` this setting is ignored | `...`
`users.ldap.ssl.clientKey` | Private key of the LDAP client. If `users.ldap.ssl.enabled` is `false` this setting is ignored | `...`
`users.ldap.dn` | Template used as DN when authenticating the user against the LDAP server, here the token **`username`** will be replaced with the username of who is currently trying to login in the hub frontend. | `uid={username},dc=people,dc=example,dc=com`
`users.container.image` | Docker image for the user notebook server, inside this container the user home folder will be mounted throught the NFS server at `/home/{username}` | `docker.chivo.cl/jovial/user:latest`
`users.container.extraArgs` | Extra command line arguments to the notebook server | `[""]`
`users.initContainer.image` | A custom docker image that runs before the actual notebook container starts, inside this container the user home folder will be mounted throught the NFS server at `/home/{username}` | `docker.chivo.cl/jovial/installer:latest`
`hub.debug` | While starting a user pod, the hub server can print additional information related to JOVIAL internal configurations, use this setting to enable or disable this messages. | `false`
`hub.timeout` | Timeout in seconds to wait for the user pod to start and initialize communication with the hub, since it is possible to take a long time to provision or pull the user container we set it at a high value by default | `1200`

To set configuration values through the command line:

```console
$ helm install jovial/ --name jovial \
    --set k8s.domain=cluster.example.com
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
$ helm install jovial/ --name jovial -f values.yaml
```