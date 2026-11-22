# The giddygiddyboy practice bot (Go, MIT licence in LICENSE, upstream justnau/giddygiddyboy-mech-royale at e19e3c8),
# taken unchanged from the public copy in charliescull/mech-royale-bot (drivers/giddy, commit 6d09b331).
FROM golang:1.26.1-bookworm@sha256:ab3d6955bbc813a0f3fdf220c1d817dd89c0b3f283777db8ece4a32fe7858edd AS build
WORKDIR /src
COPY go.mod ./
COPY mech ./mech
COPY cmd/bot ./cmd/bot
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -trimpath -ldflags="-s -w" -o /mechbot ./cmd/bot

FROM scratch
COPY --from=build /mechbot /mechbot
USER 65534:65534
ENTRYPOINT ["/mechbot"]
