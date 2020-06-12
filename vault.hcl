container "vault_one" {
  image {
    name = "vault:1.4.2"
  }

  command = [
    "vault",
    "server",
    "-config=/config/vault.hcl"
  ]

  port {
    local = 8200
    remote = 8200
    host = 8200
  }

  privileged = true

  volume {
    source = "./config/vault_one.hcl"
    destination = "/config/vault.hcl"
  }

   volume {
    source = "./data/one"
    destination = "/tmp/vault"
  }

  env {
    key = "VAULT_ADDR"
    value = "http://localhost:8200"
  }

  network {
    name = "network.public"
    ip_address = "10.15.0.201"
  }
}

container "vault_two" {
  image {
    name = "vault:1.4.2"
  }

  command = [
    "vault",
    "server",
    "-config=/config/vault.hcl"
  ]

  port {
    local = 8200
    remote = 8200
  }

  privileged = true

  volume {
    source = "./config/vault_two.hcl"
    destination = "/config/vault.hcl"
  }

  volume {
    source = "./data/two"
    destination = "/tmp/vault"
  }

  env {
    key = "VAULT_ADDR"
    value = "http://localhost:8200"
  }

  network {
    name = "network.public"
    ip_address = "10.15.0.202"
  }
}

container "vault_three" {
  image {
    name = "vault:1.4.2"
  }

  command = [
    "vault",
    "server",
    "-config=/config/vault.hcl"
  ]

  port {
    local = 8200
    remote = 8200
  }

  privileged = true

  volume {
    source = "./config/vault_three.hcl"
    destination = "/config/vault.hcl"
  }

   volume {
    source = "./data/three"
    destination = "/tmp/vault"
  }

  env {
    key = "VAULT_ADDR"
    value = "http://localhost:8200"
  }

  network {
    name = "network.public"
    ip_address = "10.15.0.203"
  }
}