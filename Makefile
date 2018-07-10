REGISTRY_NAME = quay.io/samblade/lxcfs-initializer
IMAGE_VERSION = v0.0.3
BIN = lxcfs-initializer

.PHONY: all $(BIN) clean

all: $(BIN)

$(BIN):
	GOOS=linux go build -a --ldflags '-extldflags "-static"' -tags netgo -installsuffix netgo -o $(BIN) .

build-container: $(BIN)
	docker build -t $(REGISTRY_NAME):$(IMAGE_VERSION) .

push-container: build-container
	docker push $(REGISTRY_NAME):$(IMAGE_VERSION)

clean:
	go clean -r -x
	rm -f $(BIN)

