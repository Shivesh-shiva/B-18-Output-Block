rg = {
  rg1 = {
    name     = "shivesh-rg"
    location = "centralindia"
  }
}


acr = {
  acr1 = {
    name     = "shiveshacr"
    rg_name  = "shivesh-rg"
    location = "centralindia"
    sku      = "Standard"
  }
}

aks = {
  aks1 = {
    name                   = "shivesh-aks"
    rg_name                = "shivesh-rg"
    location               = "centralindia"
    dns_prefix             = "shivesh"
    default_node_pool_name = "pool1"
    node_count             = 1
    vm_size                = "Standard_A2_v2"
    default_node_pools     = "None"
    existing_acr_key       = "acr1"
  }
}