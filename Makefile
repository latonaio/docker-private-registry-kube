init:
	-sudo rm -rf /var/lib/aion/certs
	-sudo mkdir /var/lib/aion/certs
	bash ./generate_crt.sh

apply:
	bash docker-private-registry-kubectl-apply.sh

delete:
	kubectl delete -f ./registry -f ./ui  -R
