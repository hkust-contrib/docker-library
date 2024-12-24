source "docker" "actions-runner" {
  build {
    path = "${path.root}/templates/actions-runner/Dockerfile"
    build_dir = "${path.root}/templates/actions-runner"
    args = {
    	"RUNNER_VERSION" = local.packages["actions-runner"].version
    }
  }
  commit = true
}