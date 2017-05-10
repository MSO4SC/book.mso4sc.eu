all: build

build:
	asciidoctor -a reproducible -S unsafe -a allow-uri-read README.adoc

install:
	gem install pygments.rb
	gem install asciidoctor

serve:
	bundle exec jekyll serve
