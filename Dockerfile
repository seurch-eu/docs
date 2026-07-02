# Build the static site with Hugo, then serve it with nginx. The final image
# contains only the rendered HTML/CSS/JS, no Hugo, no source.

# ---- build stage -----------------------------------------------------------
# Debian (glibc) base: the Hugo *extended* binary is linked against glibc and
# won't run on Alpine/musl.
FROM debian:bookworm-slim AS build

# Keep in sync with the theme's minimum (extended build required for SCSS) and
# with .github/workflows/. Override at build time with --build-arg if needed.
ARG HUGO_VERSION=0.163.3
ARG BASE_URL=https://docs.searpa.eu/

RUN apt-get update \
 && apt-get install -y --no-install-recommends curl ca-certificates git \
 && curl -sSL "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz" \
      | tar -xz -C /usr/local/bin hugo \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /src
COPY . .
# .git is present in the build context so enableGitInfo can resolve per-page
# "last modified" dates; the final image discards it.
RUN hugo --gc --minify --baseURL "${BASE_URL}"

# ---- serve stage -----------------------------------------------------------
FROM nginx:1.27-alpine

COPY deploy/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /src/public /usr/share/nginx/html

EXPOSE 80
