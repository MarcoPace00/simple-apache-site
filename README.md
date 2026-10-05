# simple-apache-site

A minimal static website served by the Apache HTTP Server (httpd 2.4).

## Structure

```
public-html/      # site content (Apache DocumentRoot)
  index.html
  about.html
  404.html
  css/style.css
conf/site.conf    # extra Apache settings (ServerName, custom 404)
Dockerfile        # builds on the official httpd:2.4 image
.github/workflows/ci.yml  # GitHub Actions pipeline
```

## Run with Docker

```sh
docker build -t simple-apache-site .
docker run -d --name simple-apache-site -p 8080:80 simple-apache-site
```

Then open http://localhost:8080.

## Run on an existing Apache install

Copy the contents of `public-html/` into your Apache `DocumentRoot`
(e.g. `/var/www/html` on Debian/Ubuntu, `C:\Apache24\htdocs` on Windows)
and add the lines from `conf/site.conf` to `httpd.conf`, then restart Apache.

## CI/CD

`.github/workflows/ci.yml` runs on GitHub Actions on every push and pull request to `main`:

1. **lint** – checks the HTML with HTMLHint.
2. **test** – builds the Docker image, starts Apache, validates its config
   (`httpd -t`) and checks that pages return the expected HTTP status codes
   (200 for real pages, 404 for missing ones).

Docker is not needed on your computer for this: GitHub's runners already have it.
See the results in the **Actions** tab of the repository.
