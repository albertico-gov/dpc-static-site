IG_PUBLISHER = ./.bin/org.hl7.fhir.publisher.jar

.PHONY: install-git-hooks
install-git-hooks:
	git config core.hookspath .git-hooks

${IG_PUBLISHER}:
	-mkdir ./.bin
	curl -L https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar -o ${IG_PUBLISHER}

.PHONY: ig/publish
ig/publish: ${IG_PUBLISHER}
	@echo "Building Implementation Guide"
	@java -jar ${IG_PUBLISHER} -ig implementation_guide/ig.json
