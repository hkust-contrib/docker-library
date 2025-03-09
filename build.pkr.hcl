data "http" "supplychain" {
  url = "https://artifact.narwhl.dev/upstream/current.json"
}

locals {
  packages = jsondecode(data.http.supplychain.body).syspkgs
}

build {
  sources = [
    "source.docker.actions-runner",
    "source.docker.caddy"
  ]

  post-processors {
    post-processor "docker-tag" {
      repository = "${var.registry}/${var.registry_namespace}/${source.name}"
      tags       = ["latest", local.packages[source.name].version]
      only       = [
        "docker.actions-runner",
        "docker.caddy"
      ]
    }

    post-processor "docker-push" {
      login          = true
      login_server   = var.registry
      login_username = var.registry_username
      login_password = var.registry_password
    }
  }
}
