data "github_branch" "main" {
  repository = var.repo_name
  branch     = "main"
}

resource "github_repository_environment" "deploy_env" {
  environment = var.env_name
  repository  = var.repo_name
  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }
}

resource "github_actions_environment_secret" "docker_reg_config" {
  repository      = var.repo_name
  environment     = github_repository_environment.deploy_env.environment
  secret_name     = "DOCKER_REG_CONFIG"
  plaintext_value = var.docker_reg
}

resource "github_actions_environment_secret" "docker_reg_username" {
  repository      = var.repo_name
  environment     = github_repository_environment.deploy_env.environment
  secret_name     = "DOCKER_REG_USERNAME"
  plaintext_value = var.docker_reg_username
}

resource "github_actions_environment_secret" "docker_reg_password" {
  repository      = var.repo_name
  environment     = github_repository_environment.deploy_env.environment
  secret_name     = "DOCKER_REG_PASSWORD"
  plaintext_value = var.docker_reg_password
}

resource "github_actions_environment_secret" "docker_reg_name" {
  repository      = var.repo_name
  environment     = github_repository_environment.deploy_env.environment
  secret_name     = "DOCKER_REG_NAME"
  plaintext_value = var.docker_reg_name
}

resource "github_actions_environment_secret" "docker_reg_url" {
  repository      = var.repo_name
  environment     = github_repository_environment.deploy_env.environment
  secret_name     = "DOCKER_REG_URL"
  plaintext_value = var.docker_reg_url
}

resource "github_actions_environment_secret" "cdn_access_key" {
  repository      = var.repo_name
  environment     = github_repository_environment.deploy_env.environment
  secret_name     = "CDN_ACCESS_KEY"
  plaintext_value = var.cdn_access_key
}

resource "github_actions_environment_secret" "cdn_secret_key" {
  repository      = var.repo_name
  environment     = github_repository_environment.deploy_env.environment
  secret_name     = "CDN_SECRET_KEY"
  plaintext_value = var.cdn_secret_key
}

resource "github_actions_environment_secret" "cdn_space_name" {
  repository      = var.repo_name
  environment     = github_repository_environment.deploy_env.environment
  secret_name     = "CDN_SPACE_NAME"
  plaintext_value = var.cdn_space_name
}

resource "github_actions_environment_secret" "cdn_region" {
  repository      = var.repo_name
  environment     = github_repository_environment.deploy_env.environment
  secret_name     = "CDN_REGION"
  plaintext_value = var.cdn_region
}

resource "github_actions_environment_secret" "cdn_out_dir" {
  repository      = var.repo_name
  environment     = github_repository_environment.deploy_env.environment
  secret_name     = "CDN_OUT_DIR"
  plaintext_value = var.cdn_out_dir
}

resource "github_actions_environment_secret" "cluster_name" {
  repository      = var.repo_name
  environment     = github_repository_environment.deploy_env.environment
  secret_name     = "CLUSTER_NAME"
  plaintext_value = var.cluster_name
}