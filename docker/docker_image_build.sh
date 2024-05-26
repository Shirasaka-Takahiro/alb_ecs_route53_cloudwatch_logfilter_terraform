#!/bin/bash

# Docker イメージをビルドするためのシェルスクリプト

# ビルドするイメージの名前とバージョン
IMAGE_NAME="takahiros991/ecs_terraform-image"
IMAGE_VERSION="v1"

# Dockerfile のあるディレクトリへ移動
cd /home/takahiro/terraform/alb_ecs_route53_terraform/docker

# Docker イメージをビルド
docker build -t $IMAGE_NAME:$IMAGE_VERSION .

# Docker　イメージの作成確認
docker images | grep $IMAGE_NAME