# [JOVIAL](https://jovial.chivo.cl) - Jupyter OVerride for Astronomical Libraries

<p align="center">
<img src="https://www.chivo.cl/media/service-images/jovial.jpg" width="500">
</p>

JOVIAL is a notebook-based cloud environment to process astronomical data on-line. This service provides Jupyter Notebooks that are executed in the cloud to astronomers. No installation is required from the user, so is available from any device with a recent web browser.

The service is in `alpha` and you need an account to use it. If you are interested in this project please contact maray@inf.utfsm.cl

## How to use it

If you already have an account you can go to the [website](https://jovial.chivo.cl) and try some tutorials from [here](https://github.com/maray/jupyter-tutorial-adass17).

## Private Deployment

It is possible to deploy your own private version of JOVIAL, you will need a working [Kubernetes](https://kubernetes.io) cluster with the [helm](https://helm.sh/) package manager installed.

Once you are ready to deploy JOVIAL read the [deployment](deployment.md) document.
