#Criação de um repo no Artifact Registry
resource "google_artifact_registry_repository" "hackaton_repo" {
  location = var.region
  repository_id = "grupo01hacka"
  description = "Imagens Docker"
  format = "DOCKER"
}

# Criação de uma instancia My SQL
resource "google_sql_database_instance" "hackaton_my_sql" {
  name                 = "hacka-instance-mysql"
  project              = "${var.project_name}"
  region               = "${var.region}"
  database_version     = "MYSQL_8_0"
  
  settings {
    tier = "${var.db_tier}"
    
    location_preference {
      zone = "${var.zone}"
    }

    database_flags {
      name  = "log_bin_trust_function_creators"
      value = "on"
    }

    ip_configuration {
      ipv4_enabled = "true"
      authorized_networks {
        value = "0.0.0.0/0"
      }
    }
  }
}

# Criacao do banco de dados
resource "google_sql_database" "my_sql_db" {
  name      = "${var.db_name}"
  project   = "${var.project_name}"
  instance  = "${google_sql_database_instance.hackaton_my_sql.name}"
  charset   = ""
  collation = ""
}

# Criacao do usuario
resource "google_sql_user" "my-sql" {
  name     = "dbadmin"
  project  = "${var.project_name}"
  instance = "${google_sql_database_instance.hackaton_my_sql.name}"
  host     = "%"
  password = "Hackaton@2023"
}