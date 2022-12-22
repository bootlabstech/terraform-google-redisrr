data "google_compute_network" "redis-network" {
  name    = var.name_reserved_ip_range
  project = var.host_project_id
}
resource "google_project_service" "redisapi" {
  project = var.project_id
  service = "redis.googleapis.com"
}
resource "google_redis_instance" "gcp_redis" {
  depends_on              = [google_project_service.redisapi]
  for_each                = { for redis in var.rediscache_details : redis.name => redis }       
  name                    = each.value.name
  memory_size_gb          = each.value.memory_size_gb 
  replica_count           = each.value.replica_count
  read_replicas_mode      = each.value.read_replicas_mode
  authorized_network      = var.authorized_network
  redis_configs           = var.redis_configs
  redis_version           = var.redis_version
  tier                    = var.tier
  region                  = var.region
  project                 = var.project_id
  auth_enabled            = var.auth_enabled
  transit_encryption_mode = var.transit_encryption_mode
  connect_mode            = var.connect_mode
  reserved_ip_range       = data.google_compute_network.redis-network.id

}
