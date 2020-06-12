docs "docs" {
  path  = "./docs"
  port  = 8080
  open_in_browser = true

  index_title = "Vault"
  index_pages = [ 
    "index",
  ]

  network {
    name = "network.public"
  }
}

container "tools" {
  image   {
    name = "shipyardrun/tools:v0.0.5"
  }
  
  network {
    name = "network.public"
  }

  env {
      key = "VAULT_ADDR"
      value ="http://vault-one.container.shipyard.run:8200"
  }

  entrypoint = ["tail", "-f", "/dev/null"]
}