# Comprehensive guide step by step how to deploy Jovial

## Hardware and system 
### Hardware

The host servers are 3 compute nodes with 2 CPUs Intel Xeon E5-2680 and 128 Gb of RAM each. 
The storage is Huawei oceanstor(NAS)

### Software
All the nodes run CentOS 7 with kernel version 3.10.0-123.20.1.el7.x86_64 

## Introduction, architecture and goals

# What is Jovial?

Jovial is a platform where a server of JupyterHub (an application that permits multiuser spawns of Jupyter notebooks) runs within a
Kubernetes infrastructure. The users have a personal account and the notebook spawns in pods of a single docker container where the users' files are attached by docker volume.
The file is managed and mounted in the hosts by LustreFS.

So, in general, is a safe and high available implementation of a JupyterHub server with the collection of basic software needed to
do data analysis in an isolated and private persistent environment.

The next figure illustrates the general architecture

## Firsts steps
#Kubeadm and Kubernetes basic

The first step is deploying Kubernetes. This is a complicated task if you want to do it with your bare hands,
but is easy with Kubeadm. [This guide](https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/) will teach you how to install Kubeadm and how to make a Kubernete cluster.
* Note: In our implementation, we use Flanneld as our network plug-in and we created a namespace called jovial where the Jupyterhub server and the users' pods where allocated
#Kubernetes post-installation task

## JupyterHub




