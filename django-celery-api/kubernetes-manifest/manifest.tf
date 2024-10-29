resource "kubernetes_manifest" "cloudflare-cluster-issuer" {
  manifest = yamldecode(<<YAML
    apiVersion: cert-manager.io/v1
    kind: ClusterIssuer
    metadata:
      name: cloudflare-cluster-issuer
    spec:
      acme:
        server: "https://acme-staging-v02.api.letsencrypt.org/directory"
        email: "${var.cloudflare_email}"
        privateKeySecretRef:
          name: cloudflare-cluster-issuer
        solvers:
        - dns01:
            cloudflare:
              email: "${var.cloudflare_email}"
              apiKeySecretRef:
                name: cloudflare-api-token-secret
                key: api-token
          selector:
            dnsZones:
            - "${var.cloudflare_main_domain}"
    YAML
  )
}

resource "kubernetes_manifest" "cloudflare-cluster-certificate" {
  manifest = yamldecode(<<YAML
    apiVersion: cert-manager.io/v1
    kind: Certificate
    metadata:
      name: cloudflare-cluster-certificate
      namespace: default
    spec:
      secretName: domain-tls
      issuerRef:
        name: cloudflare-cluster-issuer
      duration: 2160h0m0s
      renewBefore: 720h0m0s
      dnsNames:
      - "${var.cloudflare_main_domain}"
      - "*.${var.cloudflare_main_domain}"
    YAML
  )
  depends_on = [kubernetes_manifest.cloudflare-cluster-issuer]
}

resource "kubernetes_manifest" "service_account_admin_user" {
  manifest = yamldecode(<<YAML
    apiVersion: v1
    kind: ServiceAccount
    metadata:
      name: admin-user
      namespace: kubernetes-dashboard
    YAML
  )
}

resource "kubernetes_manifest" "service_account_role" {
  manifest = yamldecode(<<YAML
    apiVersion: rbac.authorization.k8s.io/v1
    kind: ClusterRoleBinding
    metadata:
      name: admin-user
    roleRef:
      apiGroup: rbac.authorization.k8s.io
      kind: ClusterRole
      name: cluster-admin
    subjects:
    - kind: ServiceAccount
      name: admin-user
      namespace: kubernetes-dashboard
    YAML
  )
  depends_on = [kubernetes_manifest.service_account_admin_user]
}

resource "kubernetes_manifest" "service_account_secret" {
  manifest = yamldecode(<<YAML
    apiVersion: v1
    kind: Secret
    metadata:
      name: admin-user
      namespace: kubernetes-dashboard
      annotations:
        kubernetes.io/service-account.name: "admin-user"   
    type: kubernetes.io/service-account-token
    YAML
  )
  depends_on = [kubernetes_manifest.service_account_admin_user]
}


resource "kubernetes_secret" "vso-demo-sp" {
  metadata {
    name      = "vso-demo-sp"
    namespace = "default"
  }
  type = "Opaque"
  data = {
    "clientID"     = var.HCP_CLIENT_ID
    "clientSecret" = var.HCP_CLIENT_SECRET
  }
}

resource "kubernetes_manifest" "secret_store" {
  manifest = yamldecode(<<YAML
    apiVersion: secrets.hashicorp.com/v1beta1
    kind: HCPAuth
    metadata:
      name: default
      namespace: vault-secrets-operator-system
    spec:
      organizationID: ${var.HCP_ORG_ID}
      projectID: ${var.HCP_PROJECT_ID}
      servicePrincipal:
        secretRef: vso-demo-sp
    YAML
  )
  depends_on = [ kubernetes_secret.vso-demo-sp ]
}


resource "kubernetes_manifest" "rest-api-secret" {
  manifest = yamldecode(<<YAML
    apiVersion: secrets.hashicorp.com/v1beta1
    kind: HCPVaultSecretsApp
    metadata:
      name: ${var.HCP_APP_NAME}
      namespace: default
    spec:
      appName: ${var.HCP_APP_NAME}
      destination:
        create: true
        labels:
          hvs: "true"
        name: ${var.HCP_APP_NAME}
      refreshAfter: 5m
    YAML
  )
  depends_on = [ kubernetes_manifest.secret_store ]
}