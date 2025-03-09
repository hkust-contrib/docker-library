source "docker" "actions-runner" {
  build {
    path      = "${path.root}/templates/actions-runner/Dockerfile"
    build_dir = "${path.root}/templates/actions-runner"
    arguments = {
      "RUNNER_VERSION" = local.packages["actions-runner"].version
    }
  }
  commit = true
}

source "docker" "caddy" {
  build {
    path      = "${path.root}/templates/caddy/Dockerfile"
    build_dir = "${path.root}/templates/caddy"
    arguments = {
      "CADDY_VERSION" = local.packages["caddy"].version
    }
  }
}
