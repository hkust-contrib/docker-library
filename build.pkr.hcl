data "http" "supplychain" {
  url = "https://artifact.narwhl.dev/upstream/current.json"
}

locals {
  packages = jsondecode(data.http.supplychain.body).syspkgs
}

build {
  sources = ["source.docker.actions-runner"]

  post-processors {
    post-processor "docker-tag" {
      repository = "${var.registry}/${var.registry_namespace}/${source.name}"
      tags       = ["latest", local.packages["actions-runner"].version]
      only       = ["docker.actions-runner"]
    }

    post-processor "docker-push" {}
  }
}
