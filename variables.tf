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

variable "sql_create_db" {
    description = "Criacao do DB SQL"
    type        = string
    default     = ""
}