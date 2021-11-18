FROM barichello/godot-ci:3.4 AS builder
COPY . /src
WORKDIR /src
RUN rm -rf Build && mkdir Build
RUN godot --export web

FROM nginx:latest
COPY --from=builder /src/Build /usr/share/nginx/html

