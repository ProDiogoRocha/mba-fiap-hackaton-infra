#Criação de um repo no Artifact Registry
resource "google_artifact_registry_repository" "hackaton_repo" {
  location = var.region
  repository_id = "grupo01hacka"
  description = "Imagens Docker"
  format = "DOCKER"
}

# Criação do banco de dados
resource "google_sql_database_instance" "hackaton_db_instance" {
  name             = "my-database-instance"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  provisioner "local-exec" {
  command = <<EOF
      gcloud sql databases execute-sql ${google_sql_database_instance.my_instance.name} 
        --instance=${google_sql_database_instance.hackaton_db_instance.name} 
        --database=${google_sql_database.hackaton_database.name}
        --project=var.project_name 
        --sql="$(file("Playlist.sql"))"

  EOF
  }
}

resource "google_sql_database" "hackaton_database" {
  name     = "playlist"
  instance = google_sql_database_instance.hackaton_db_instance.name
  charset  = "utf8"
  collation = "utf8_general_ci"
}

resource "google_sql_user" "hackaton_user" {
  name     = "hackaton"
  instance = google_sql_database_instance.hackaton_db_instance.name
  password = "Hackaton@2023"
}