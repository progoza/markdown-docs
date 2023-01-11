# Jekyll

Jekyll  is an app that generates a static html from markdown. There is a lot of free/open source themes for jekyll. 

## Install jekyll

First, Ruby and RubyGem needs to be insrtalled.
After that:

```
gem install jekyll bundler jekyll-paginate jekyll-gist
```

Jekyll can also render PDFs.

## Using jekyll with in obsidian vault

For some articles in my Obsidian Vault I prepared scripts that render static html using jekyll.

There are 2 flavours: `build.sh` for Linux and `build.cmd` for Windows.
These scripts copy the template from `_template` directory and selected articles from Obsidian vault into `_build` dir; next they generate the  html into `_output`.
After html is generated then there is another pair of scripts `deploy.sh` / `deploy.cmd` that copies these htmls to my public html github repo (which must be checked out under the same directory as this repo).

I use sligtly customized Hyde temaple: [https://hyde.getpoole.com/](https://hyde.getpoole.com/)

