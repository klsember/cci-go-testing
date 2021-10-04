FROM golang:1.17-alpine as builder

WORKDIR /app

# Install the dependencies
COPY go.mod ./
COPY go.sum ./
RUN go mod download -json

# # Copy app into the container
# WORKDIR /app/tls
# RUN go run /usr/local/go/src/crypto/tls/generate_cert.go --rsa-bits=2048 --host=localhost
# WORKDIR /app

COPY . .

RUN go get ./pkg/forms \
    && go get ./pkg/models \
    && go get ./pkg/models/postgres

# Compile the application
RUN go build -o ./app ./cmd/web

EXPOSE 4000

CMD ["./app"]