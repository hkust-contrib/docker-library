variable "registry" {
  type    = string
  default = env("REGISTRY")
}

variable "registry_namespace" {
  type    = string
  default = env("GITHUB_REPOSITORY_OWNER")
}
