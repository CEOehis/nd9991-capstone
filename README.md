# Cloud DevOps NanoDegree Capstone Project

[![CEOehis](https://circleci.com/gh/CEOehis/nd9991-capstone.svg?style=svg)](https://circleci.com/gh/CEOehis/nd9991-capstone)
## Project Overview

This project is my Capstone project for the Udacity Cloud DevOps Engineer Nanodegree.
It demonstrates a CI/CD pipeline for a micro services application with rolling deployment using Kubernetes on AWS Elastic Kubernetes Service (EKS).

### The Application

The application is a NodeJS/Express Header parser microservice. It exposes an API endpoint at `/whoami` that parses a clients request header and
produces useful information about the client such as the IP Address and client software.

### CI/CD Pipeline

The CI/CD pipeline involves a couple of checks including linting and vulnerability checks as well as the composition of the final
artifacts that would be deployed. All the jobs are run using Circle CI.

The build step uses a Docker to build a docker container and pushes it to the Docker registry. This is then used as the image for the Kubernetes deployement.

### Deployment Steps

I have chosen to build the necessary infrastructure apart from the CI/CD integration using the `eksctl` tool in a simple script. This builds out
the necessary underlying architecture needed for the deployment. The script can be run using:

```sh
./infrastructure/scripts/create_cluster.sh
```

To delete the cluster and the underlying resources, run:

```sh
./infrastructure/scripts/delete_cluster.sh
```

The remaining deployment steps are handled by the Circle CI configuration:

- Install Dependencies
- Run Linting on the API code
- Run automated tests
- Check for Security vulnerabilities in dependencies
- Build and publish latest docker image
- Deploy docker image to kubernetes cluster
