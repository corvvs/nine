terraform {
    # 必要な provider
    required_providers {
        docker = {
            source  = "kreuzwerker/docker"
            version = "~> 3.0.1"
        }
    }
}

# [プロバイダー]
# Terraformが対象とするクラウドプロバイダーやサービスプロバイダーを定義します。
# プロバイダーの設定では、使用するプロバイダーとそのバージョン、認証情報、エンドポイントなどの情報を指定します。

# provider "docker" について
provider "docker" {
    # ローカルの docker なので特に何も指定しなくてよい？
}

# [リソース]
# クラウドプロバイダー上のインフラストラクチャ要素（仮想マシン、ネットワーク、ストレージなど）を定義します。
# リソースブロックには、リソースタイプ、リソース名、およびリソースの設定が含まれます。

# https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/image
resource "docker_image" "nginx" {
    # [required] name (String)
    # The name of the Docker image, including any tags or SHA256 repo digests.
    name            = "nginx"

    # keep_locally (Boolean)
    # If true, then the Docker image won't be deleted on destroy operation.
    # If this is false, it will delete the image from the docker local storage on destroy operation.
    keep_locally    = false
}

# https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container
resource "docker_container" "nginx" {
    # [required] image (String)
    # The ID of the image to back this container.
    # The easiest way to get this value is to use the docker_image resource as is shown in the example.
    image   = docker_image.nginx.image_id
    name    = "tutorial"

    # ports (Block List)
    # Publish a container's port(s) to the host.
    # (see below for nested schema)
    ports {
        # [required] internal (Number)
        # Port within the container.
        internal = 80

        # external (Number)
        # Port exposed out of the container.
        # If not given a free random port >= 32768 will be used.
        external = 8000
    }
}
