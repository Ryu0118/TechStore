MINT_RUN = mint run

.PHONY: format
format:
	$(MINT_RUN) swiftformat .
