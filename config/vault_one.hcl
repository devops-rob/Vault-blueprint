listener "tcp" {
  address         = "127.0.0.1:8200"
  cluster_address = "10.15.0.201:8201"
  tls_disable     = true
}

listener "tcp" {
  address     = "10.15.0.201:8200"
  tls_disable = true
}

storage "raft" {
  path = "/tmp/vault"
  node_id = "vault_one"
}

api_addr        = "https://10.15.0.201:8200"
cluster_addr    = "https://10.15.0.201:8201"
ui              = true
disable_mlock   = true