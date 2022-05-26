FROM golang:1.17 as builder

WORKDIR /workspace
# Copy the Go Modules manifests
COPY go.mod go.mod
COPY go.sum go.sum
# Copy the go source
COPY cmd/ cmd/
COPY vendor/ vendor/
# Build
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GO111MODULE=on \
     go build -a -o local-subdir-external-provisioner -mod=vendor cmd/local-subdir-external-provisioner/provisioner.go

FROM alpine:3.12
RUN apk update --no-cache && apk add ca-certificates
WORKDIR /
COPY --from=builder /workspace/local-subdir-external-provisioner .
ENTRYPOINT ["/local-subdir-external-provisioner"]
