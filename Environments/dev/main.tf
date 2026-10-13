module "rg" {
  source = "../../modules/Resource_group"
  rg     = var.rg
}

module "acr" {
  source     = "../../modules/ACR"
  depends_on = [module.rg]
  acr        = var.acr
}

module "aks" {
  source     = "../../modules/AKS"
  depends_on = [module.rg, module.acr]
  aks        = var.aks
  acr_id     = module.acr.acr_id
}