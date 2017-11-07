HELP="Usage: make <option> \n\
\nOptions:\n\
\n\
\tinstall - install gem files (first time, bundler required) \n\
\tserve   - run a local web server (open localhost:4000 in the webbrowser) \n\
\tclean   - clean gem lock file (redo install after) \n\
\thelp    - print this help\n\n"


all: help

build:
	asciidoctor -a reproducible -S unsafe -a allow-uri-read README.adoc

install:
	bundle install --path vendor/bundle

serve:
	bundle exec jekyll serve

clean:
	rm -rf Gemfile.lock
	rm -rf ./vendor

help:
	@printf ${HELP}
