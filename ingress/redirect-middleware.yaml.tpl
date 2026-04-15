apiVersion: traefik.io/v1alpha1
kind: Middleware
metadata:
  name: redirect-to-root
  namespace: default
spec:
  redirectRegex:
    regex: "^https?://[^/]+(.*)"
    replacement: "https://${REDIRECT_TARGET}$1"
    permanent: false