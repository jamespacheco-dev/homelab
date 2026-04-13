apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: jamespacheco-dev-tls
  namespace: default
  annotations:
    reflector.v1.k8s.emberstack.com/reflection-allowed: "true"
    reflector.v1.k8s.emberstack.com/reflection-auto-enabled: "true"
    reflector.v1.k8s.emberstack.com/reflection-allowed-namespaces: ""
spec:
  secretName: jamespacheco-dev-tls
  issuerRef:
    name: letsencrypt-prod
    kind: ClusterIssuer
  dnsNames:
  - ${DOMAIN}
  - "*.${DOMAIN}"