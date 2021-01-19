variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 3
  description = "number of gke nodes"
}

# GKE cluster
resource "google_container_cluster" "primary" {
  name     = "cluster-1"
  location = "us-central1-c"
  project = "gcp-training-281204"
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = "gcp-training-us-vpc"
  subnetwork = "gcp-training-us-vpc-sub-1"

  master_auth {
    username = var.gke_username
    password = var.gke_password

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "${google_container_cluster.primary.name}-node-pool"
  location   = "us-central1-c"
  project = "gcp-training-281204"
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = "123"
    }

    # preemptible  = true
    machine_type = "n1-standard-1"
    tags         = ["gke-node", "cluster-1"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
