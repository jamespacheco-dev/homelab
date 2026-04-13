apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: grafana
  namespace: monitoring
spec:
  ingressClassName: traefik
  tls:
  - hosts:
    - grafana.${DOMAIN}
    secretName: jamespacheco-dev-tls
  rules:
  - host: grafana.${DOMAIN}
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: monitoring-grafana
            port:
              number: 80