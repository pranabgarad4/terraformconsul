# Setup the Consul provisioner to use the demo cluster
provider "consul" {
  address    = "pranabmac.gateway.local:8500"
  datacenter = "dc1"
}


# Setup a key in Consul to provide inputs
data "consul_keys" "input" {
  key {
    name    = "size1"
    path    = "tf_test1/size1"
    default = "m2.small"
  }
}

# Setup a key in Consul to store the instance id and
# the DNS name of the instance
resource "consul_keys" "test" {
  key {
    name   = "gatekeeper"
    path   = "tenants/interfaces/aap.com/throttling/max"
    value  = "1234"
    delete = true
  }
}
