.PHONY: build test

build: result.zip

test:
	toncli run_tests

output/participant.json: participant.json
	cp $^ $@

output/%.fc: func/%.fc
	cp $^ $@

result.zip: output/*.fc output/participant.json
	cd output; \
	zip -r result.zip *
	mv output/result.zip .
