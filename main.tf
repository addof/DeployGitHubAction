module "RG" {
  source = "./modules/RG"

  owner = var.owner
  environment = var.environment
  plan_name = var.plan_name
  region = var.region
  rg_name = var.rg_name
  subnet_name = var.subnet_name
  vnet_name = var.vnet_name
}