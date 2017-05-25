all:
	if [[ -e simpla-payment-module.zip ]]; then rm simpla-payment-module.zip; fi
	zip -r simpla-payment-module.zip payment
