#!/bin/bash
docker build -t jmeritt/nzbget --no-cache .
docker push jmeritt/nzbget