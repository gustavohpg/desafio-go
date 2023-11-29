FROM golang:alpine AS builder

WORKDIR /app

COPY hello-world.go .

RUN go mod init main

RUN go build -o hello-world .

# starting second stage
FROM scratch

WORKDIR /app

COPY --from=builder /app .

CMD ["./hello-world"]