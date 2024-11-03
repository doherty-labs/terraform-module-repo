# Prerequisites 

- DigitalOcean Account. Get $200 of free credits [https://bit.ly/3UzTEcU](https://bit.ly/3UzTEcU)
- Auth0 Account, Register here: [https://bit.ly/3UuXeVp](https://bit.ly/3UuXeVp)
- Datadog Account, Register here: [https://bit.ly/4frmiEW](https://bit.ly/4frmiEW)
- Elastic Cloud Account, Free Trial here [https://bit.ly/3YyG1M9](https://bit.ly/3YyG1M9)
- Cloudflare, Register here: [https://bit.ly/4eczsVp](https://bit.ly/4eczsVp)
- HashiCorp Cloud Platform, Register here: [https://bit.ly/48Bab5V](https://bit.ly/48Bab5V)
  

# Architecture Overview

Django Celery terraform module

![image](https://github.com/user-attachments/assets/f78e5363-6d17-4bc4-962d-69de5b285547)

# Example Inputs 

```

digitalocean:
  token: "XXXXXXXX"
  project_name: "django-rest-api-qa"
  project_description: "django-rest-api qa environment"
  region: "lon1"
  environment: "staging"
  db_name: "db_qa"
  db_user: "db_qa_admin"
  db_size: "db-s-1vcpu-1gb"
  kube_node_count: 6
  kube_node_pool_size: "s-4vcpu-8gb"
  bucket_region: "fra1"
  caching_db_size: "db-s-1vcpu-1gb"
  spaces_access_id: "XXXX"
  spaces_secret_key: "XXXX"
  pg_pool_size: 20
  docker_reg_username: "XXXX@test.com"

auth0:
  domain: "dev-XXXX.us.auth0.com"
  terraform_client_id: "XXXX"
  terraform_client_secret: "XXXX"
  service_name: "django-rest-api"
  api_host: "XXXX"
  auth_database_connection_id: "con_XXXX"
  auth_google_connection_id: "con_XXXX"
  roles:
    - "admin"
    - "ops"
    - "customer"
  entities:
    - "customer"
    - "contact"
    - "message"
    - "form"
    - "merchant"
    - "product"
    - "order"
    - "payment"
    - "pipeline"

cloudflare:
  token: "XXXX"
  domain: "XXXX"
  email: "XXXX"

elasticcloud: 
  api_key: "XXXX"
  service_name: "django-rest-api"

hcp:
  client_id: "XXXX"
  client_secret: "XXXX"
  project_name: "django-rest-api-qa"
  app_name: "django-rest-api"
  org_id: "XXXX"

datadog:
  api_key: XXXX
  app_key: XXXX
  api_url: https://api.datadoghq.eu/
  region: "datadoghq.eu"

github:
  token: XXXX
  owner: XXXX
  repo_name: XXXX

django:
  flower_user: "XXXX"
  flower_password: "XXXX"
  django_superuser_username: "XXXX"
  django_superuser_email: "XXXX"
  django_superuser_password: "XXXX"
```

# Digital Ocean Tokens 
- Generate Terraform Token https://docs.digitalocean.com/reference/api/create-personal-access-token/
- Generate Spaces Access Token https://docs.digitalocean.com/products/spaces/how-to/manage-access/

# Auth0
- Generate Terraform Client https://auth0.com/blog/use-terraform-to-manage-your-auth0-configuration/#Create-an-Auth0-client-using-HashiCorp-Terraform

# Cloudflare
- Generate access token https://developers.cloudflare.com/fundamentals/api/get-started/create-token/

# Elastic cloud 
```
To generate an API key, follow these steps:

Open you browser and navigate to https://cloud.elastic.co/login.
Log in with your email and password.
Click on Elasticsearch Service.
Navigate to Features > API Keys and click on Generate API Key.
Choose a name for your API key.
Save your API key somewhere.

```

# Hashicorp Cloud Platform 
- Generate token for terraform provider access https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/guides/auth

# Datadog 
- Generate API Key and App Key https://docs.datadoghq.com/account_management/api-app-keys/

# GitHub 
- Generate Personal Access Token https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens
