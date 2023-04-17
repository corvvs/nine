aws-cli:
# [macOS]
	curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
	installer -pkg AWSCLIV2.pkg \
		-target CurrentUserHomeDirectory \
		-applyChoiceChangesXML choices.xml
	sudo ln -s /folder/installed/aws-cli/aws /usr/local/bin/aws
	sudo ln -s /folder/installed/aws-cli/aws_completer /usr/local/bin/aws_completer

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
	terraform destroy -auto-approve



