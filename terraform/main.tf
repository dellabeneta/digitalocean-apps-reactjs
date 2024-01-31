terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

variable "do_token" {}

resource "digitalocean_app" "app" {
  spec {
    name   = "app"
    region = "sfo"

    static_site {
      name          = "app"
      build_command = "npm install && npm run build"
      github {
        repo           = "dellabeneta/reactjs"
        branch         = "master"
        deploy_on_push = true
      }
    }
  }
}