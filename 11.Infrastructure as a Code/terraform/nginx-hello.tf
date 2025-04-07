terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

resource "docker_image" "nginxdemosvlado" {
  name = "nginxdemos/hello"
}

resource "docker_container" "vlado" {
  name  = "nginxdemos-container"
  image = resource.docker_image.nginxdemosvlado.name

  ports {
    internal = 80
    external = 8002
  }
}
