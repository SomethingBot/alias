ProjectName := github.com/SomethingBot/alias
GitCommit   := $(shell git rev-parse HEAD)
GitTag      := $(shell git tag --points-at HEAD)

build:
	go build -ldflags "-X main.GitCommit=$(GitCommit) -X main.GitTag=$(GitTag) -X main.Mode=Dev"

test:
	go vet
	go test

spawn-redis:
	podman run -p 6379:6379 --rm --name alias-redis-dev docker.io/library/redis

test-integration:
	go test -tags=integration

lint:
	go fmt -v

run: build
	ALIAS_REDIS_ADDRESS=127.0.0.1 ./alias
