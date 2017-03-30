BUILDER_IMAGE = callforamerica:nginx-rtmp-builder
IMAGE = callforamerica/nginx-rtmp

build-builder:
	docker build -t $(BUILDER_IMAGE) -f Dockerfile.build .
	docker run -v $(PWD)/bins:/host $(BUILDER_IMAGE)

build:
	docker build -t $(IMAGE) .

clean:
	rm -rf bins/*.so

install-systemd-unit:
	cp nginx-rtmp.service /etc/systemd/system/
