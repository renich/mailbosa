build:
	scripts/build-gem

install:
	builds/mailbosa-latest.gem

all: build install

clean:
	rm -f builds/*
