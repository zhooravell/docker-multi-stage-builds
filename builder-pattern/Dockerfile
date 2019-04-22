FROM alpine:latest
# Add ssl support
RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY app .

CMD ["./app"]

