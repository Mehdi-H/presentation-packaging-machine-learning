SHELL := /bin/bash
.SHELLFLAGS = -ec
.SILENT:
MAKEFLAGS += --silent
.ONESHELL:
default: help

help:
	echo -e "Please use \`make \033[36m<target>\033[0m\`"
	echo -e "👉\t where \033[36m<target>\033[0m is one of"
	grep -E '^\.PHONY: [a-zA-Z_-]+ .*?## .*$$' $(MAKEFILE_LIST) \
		| sort | awk 'BEGIN {FS = "(: |##)"}; {printf "• \033[36m%-30s\033[0m %s\n", $$2, $$3}'

.PHONY: slides ## pour produire les slides
slides:
	./node_modules/reveal-md/bin/reveal-md.js slides.md --highlight-theme github

.PHONY: word-cloud  ## to generate the wordcloud from txt file
word-cloud:
	wordcloud_cli \
		--contour_color white \
		--text wtf-with-python-packaging.txt \
		--imagefile wtf-with-python-packaging.png

.PHONY: structurizr-lite ## to run structurizr-lite local server
structurizr-lite:
	docker run -it --rm \
		-p 8080:8080 \
		-v "$$(PWD)/:/usr/local/structurizr/" \
		structurizr/lite

.PHONY: tty  ## ⊹ to run tty bash terminal in local browser for demos
tty:
	ttyd -p 8080 bash

.PHONY: package-zip  ## 📦 🤐 to package in a zip archive
package-zip:
	zip -r object-detector.zip \
		presentation_pkg_ml/ pandas-1.4.3-cp310-cp310-win_amd64.whl

.PHONY: ls-zip  ## 📦 🤐 👀 to check what's in the zip
ls-zip:
	unzip -l object-detector.zip

.PHONY: package-wheel-setup  ## 🐳 🛠 to package in a wheel dist with setup.py
package-wheel-setup:
	python setup.py bdist_wheel;

.PHONY: package-wheel-build  ## 🐳 🅱️ to package in a wheel dist with build module
package-wheel-build:
	python -m build --wheel;

.PHONY: package-with-docker  ## 📦 🐳 to package in a docker container
package-with-docker:
	docker build . -t pkg-ml:local

.PHONY: run-docker-app  ## 🏃 🐳 to run dockerized app
run-docker-app:
	docker run --rm -it pkg-ml:local
