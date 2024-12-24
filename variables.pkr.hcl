variable "registry" {
  type = string
}

variable "registry_namespace" {
  type    = string
  default = env("GITHUB_REPOSITORY_OWNER")
}

variable "registry_username" {
  type = string
}

variable "registry_password" {
  type      = string
  sensitive = true
}
