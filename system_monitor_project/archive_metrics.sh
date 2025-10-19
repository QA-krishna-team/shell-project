#!/bin/bash
mkdir -p archive
today=$(date +"%Y%m%d")
tar -czf archive/metrics_${today}.tar.gz reports/* 2>/dev/null
rm -f reports/*
