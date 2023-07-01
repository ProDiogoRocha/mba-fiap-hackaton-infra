variable "project_name" {
  description = "GCP Project Name"
  type        = string
}

variable "region" {
  description = "Google Cloud region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Google Cloud zone"
  type        = string
  default     = "us-central1-c"
}

variable db_tier {
  description = "Camada de maquina. Referencia: https://cloud.google.com/sql/pricing"
  default     = "db-f1-micro"
}