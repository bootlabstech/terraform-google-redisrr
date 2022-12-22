//required variables
variable "rediscache_details" {
  description = "The rediscache details"
  type        = list(any)
}

variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used"
  type        = string
}
variable "authorized_network" {
  description = "The full name of the Google Compute Engine network to which the instance is connected. If left unspecified, the default network will be used."
  type        = string
}

variable "region" {
  description = "The name of the Redis region of the instance."
  type        = string
  default     = "asia-south1"
}

variable "redis_configs" {
  description = "Redis configuration parameters, according to http://redis.io/topics/config. Please check Memorystore documentation for the list of supported parameters"
  type        = map(string)
  default     = {}
}

variable "redis_version" {
  description = "The version of Redis software. If not provided, latest supported version will be used. Please check the API documentation linked at the top for the latest valid values."
  type        = string
  default     = "REDIS_6_X"
}

variable "tier" {
  description = "The service tier of the instance. Must be one of these values:Basic or Standard_ha"
  type        = string
  default     = "STANDARD_HA"
}

variable "auth_enabled" {
  description = "Indicates whether OSS Redis AUTH is enabled for the instance. If set to true AUTH is enabled on the instance."
  type        = bool
  default     = false
}

variable "transit_encryption_mode" {
  description = "The TLS mode of the Redis instance"
  type        = string
  default     = "SERVER_AUTHENTICATION"
}
variable "connect_mode" {
  description = "The connect mode of the Redis instance"
  type        = string
  default     = "PRIVATE_SERVICE_ACCESS"
}

variable "name_reserved_ip_range" {
  type        = string
  description = "For PRIVATE_SERVICE_ACCESS mode value must be the name of an allocated address range associated with the private service access connection,"
}

variable "host_project_id" {
  type        = string
  description = "The project id of the host project"
}


