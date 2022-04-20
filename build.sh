#!/bin/bash
docker build -t responder .
docker image prune -f
