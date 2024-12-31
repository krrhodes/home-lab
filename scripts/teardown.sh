#!/bin/bash

k3d cluster delete $CLUSTER_NAME

sudo sed -i '' '/^### Home Lab Configuration ###$,^### End Lab Configuration ###$/d' /etc/hosts