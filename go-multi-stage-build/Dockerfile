FROM golang:1.12.4-stretch as builder
# Change worck directory
WORKDIR /go/src/github.com/zhooravell/docker-multi-stage-builds/go-multi-stage-build
# Copy go code & dep files to worck directory
COPY main.go Gopkg.toml Gopkg.toml ./
# Install dep, packages and build application
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh \
    && dep version \
    && dep ensure \
    && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest
# Add ssl support
RUN apk --no-cache add ca-certificates

WORKDIR /root/
# Copy just the built artifact from the previous stage into this new stage
# The Go SDK and any intermediate artifacts are left behind, and not saved in the final image.
COPY --from=builder /go/src/github.com/zhooravell/docker-multi-stage-builds/go-multi-stage-build/app ./

EXPOSE 8080

CMD ["./app"]
