#!/bin/bash
docker buildx build --platform linux/amd64 --no-cache -t jmeritt/nzbget .
docker push jmeritt/nzbget
kubectl rollout restart deployment nzbget