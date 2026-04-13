include .env
export

.PHONY: apply-cert-manager apply-monitoring apply-hello apply-all

apply-cert-manager:
	envsubst < cert-manager/clusterissuer-stage.yaml.tpl | kubectl apply -f -
	envsubst < cert-manager/clusterissuer-prod.yaml.tpl  | kubectl apply -f -
	envsubst < cert-manager/prod-cert.yaml.tpl           | kubectl apply -f -

apply-monitoring:
	envsubst < monitoring/grafana-ingress.yaml.tpl | kubectl apply -f -

apply-hello:
	kubectl apply -f app/hello/deployment.yaml
	kubectl apply -f app/hello/service.yaml
	envsubst < app/hello/ingress.yaml.tpl | kubectl apply -f -

apply-all: apply-cert-manager apply-monitoring apply-hello
