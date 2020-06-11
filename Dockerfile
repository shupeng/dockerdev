# Compile stage
FROM golang:1.14.3 AS build-env

ADD . /dockerdev
WORKDIR /dockerdev

RUN go build -o /server

# Final stage
FROM ubuntu:latest

EXPOSE 8000

WORKDIR /
COPY --from=build-env /server /

CMD ["/server"]
