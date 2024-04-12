variable "github_enterprise_ip" {
  type = string
}

variable "sub_domain" {
  type        = string
  description = "sub domain where you want to host your GitHub Enterprise Server instance e.g. github"
  default     = "github"
}

variable "top_level_domain" {
  type        = string
  description = "top level domain where your hosted zone exists. "
}
