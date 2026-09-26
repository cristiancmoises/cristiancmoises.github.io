# Cristian Cezar Moisés — personal portfolio

[Português do Brasil](README.pt-BR.md)

This is the source repository for [cristiancezarmoises.com](https://cristiancezarmoises.com/), the personal portfolio of Cristian Cezar Moisés. I work as an IT Support Analyst in Caxias do Sul, Rio Grande do Sul, Brazil, and maintain free software projects in my spare time.

The website is generated with [GNU Guile](https://www.gnu.org/software/guile/) and [Haunt](https://haunt.dthompson.us/). English is the primary language; Brazilian Portuguese pages are generated under `/pt-br/`. The site has no database or frontend framework and contains no client-side JavaScript.

## Requirements

The repository pins **Haunt 0.4.0**. [`manifest.scm`](manifest.scm) selects the package version, and [`channels-haunt.scm`](channels-haunt.scm) pins the Guix revision that provides it.

Install [GNU Guix](https://guix.gnu.org/) or use a local Haunt 0.4.0 installation. The time-machine command below uses only this repository's channel file and does not change your global Guix configuration.

## Build the website

Clone the repository and run the reproducible build:

```sh
git clone https://github.com/cristiancmoises/cristiancmoises.github.io.git
cd cristiancmoises.github.io
guix time-machine -C channels-haunt.scm -- shell -m manifest.scm -- ./scripts/build-site.sh
```

If Haunt 0.4.0 is already available:

```sh
./scripts/build-site.sh
```

The script performs a clean `haunt build` in `site/`, removes stale generated pages, and copies the new static output to the repository root. The root output is committed as a reviewable release artifact for static hosting. Haunt remains the only site generator and source of page structure.

Preview the generated site:

```sh
haunt serve --port 8080
```

Open `http://localhost:8080/`. Use `haunt serve --watch --port 8080` while editing source files.

## Content and languages

- `haunt.scm` defines layouts, navigation, SEO metadata, language routes, sitemap, and page builders.
- `posts/` contains Markdown articles. Add `lang: en` or `lang: pt-BR` to make the article appear in the matching archive.
- Use the `built` tag only for projects whose authorship has been verified.
- `title-en` and `summary-en` provide English project-card text when the full article is currently available only in Portuguese.
- `css/` and `images/` contain the original theme and media.
- `site/` is temporary Haunt output and is ignored by Git.

Example article header:

```text
title: Project title
date: 2026-09-26 18:00
lang: en
tags: projects, built
summary: The problem solved in one sentence.
image: /images/projects/project-name.webp
project-url: https://your-forge.example/you/project-name
---
```

## Deploy to the IONOS VPS

Production serves the exact contents of `site/` from the IONOS VPS. The edge configuration in [`deploy/ionos/`](deploy/ionos/) provides HTTPS redirection, the canonical apex domain, strict security headers, static-file caching, and the custom 404 page.

Release procedure:

1. Run `./scripts/build-site.sh` and review the local output.
2. Copy `site/` into a new release directory on the server.
3. Atomically update the `/data/portfolio/current` release and validate the Nginx configuration before reloading it.
4. Verify HTTPS, redirects, headers, DNSSEC, links, and generated-file hashes.

The canonical URL is `https://cristiancezarmoises.com`; `www` redirects to the apex. DNS is hosted on the Security Ops authoritative NSD service and signed with DNSSEC.

## License and personal material

© 2026 Cristian Cezar Moisés. The source code, including the original theme and Haunt templates, is licensed under [GPLv3](LICENSE). The personal photograph and original biographical information are copyrighted by Cristian Cezar Moisés and are not licensed under the GPL. Third-party screenshots and marks retain their respective rights. See [COPYRIGHT.md](COPYRIGHT.md).
