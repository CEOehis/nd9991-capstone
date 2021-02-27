#!/bin/bash

# Create EKS cluster
eksctl create cluster \
  --name capstone-api \
  --version 1.18 \
  --region us-east-2 \
  --nodegroup-name capstone-workers \
  --node-type t2.micro \
  --nodes 3 \
  --nodes-min 1 \
  --nodes-max 4 \
  -- managed
