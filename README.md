# Koodous Documentation
Koodous documentations about the website, REST API, Yara, etc...

This project uses [mkdocs](http://www.mkdocs.org/), if you want to run it locally there are some dependencies required. In case you want to know anything else about that project, check it out at their [Github repo](https://github.com/mkdocs/mkdocs/).

## Installation
Download or clone the repo and run the next command inside the root of the project (you need pip installed)
```
pip install -r requirements.txt
```

## Run the site in development mode
Just as the mkdocs documentations explains, run the next command to start the dev server:

```
mkdocs serve
#Running at: http://127.0.0.1:8000/
```

## Build a static copy
This will *compile* the sources into static site with the styles and chosen theme (configured on mkdocs.yml)

```
mkdocs build
```
