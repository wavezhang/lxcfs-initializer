REGISTRY_NAME = quay.io/samblade/lxcfs-initializer
IMAGE_VERSION = v0.0.6
BIN = lxcfs-initializer

.PHONY: all $(BIN) clean

all: $(BIN)

$(BIN):
	if [ ! -d ./vendor ]; then dep ensure; fi
	CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' -o $(BIN) .

build-container: $(BIN)
	docker build -t $(REGISTRY_NAME):$(IMAGE_VERSION) .

push-container: build-container
	docker push $(REGISTRY_NAME):$(IMAGE_VERSION)

clean:
	go clean -r -x
	rm -f $(BIN)

