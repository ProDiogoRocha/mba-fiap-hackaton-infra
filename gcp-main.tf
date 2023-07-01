#Criação de um repo no Artifact Registry
resource "google_artifact_registry_repository" "hackaton_repo" {
  location = var.region
  repository_id = "grupo01hacka"
  description = "Imagens Docker"
  format = "DOCKER"
}
