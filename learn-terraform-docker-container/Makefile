.PHONY: init
init:
	terraform init -upgrade

.PHONY: up
up:
	terraform apply

.PHONY: forceup
forceup:
	terraform apply -auto-approve


.PHONY: down
down:
	terraform destroy
