# Website

The website can be viewed at https://gavinw.me/swift-macos. See the sections below to build and run the website locally. The site is built with [Jekyll](https://jekyllrb.com) and hosted with [GitHub Pages](https://pages.github.com) from within the **docs** folder. Since this is a GitHub project website (not a user or organization website) the baseurl must be set to the repository name `baseurl: /swift-macos` in the `docs/_config.yml` file.

## Building the environment

[Bundler](https://bundler.io) is used for the Ruby environment. See the steps below to build a local environment for the website.

If not done so already, install Bundler:

```bash
$ gem install bundler
```

Next, create a GitHub Pages Gemfile at `docs/Gemfile` by following the instructions at [github.com/github/pages-gem](https://github.com/github/pages-gem). The Gemfile must contain the following:

```
source 'https://rubygems.org'
gem 'github-pages', group: :jekyll_plugins
```

Run Bundler from within the `docs` folder to create the Ruby environment for the website:

```bash
$ bundle install
```

## Building the website

After installing the Ruby environment, run the Jekyll server from within the **docs** folder using the following command:

```bash
$ bundle exec jekyll serve
```

Bundler and the GitHub Pages gem can be updated with the following commands:

```bash
$ gem update bundler
$ bundle update github-pages
```

## Writing articles

Articles for the website are written as Markdown files located in the **docs/_articles** folder. Since this is a project website (not a user or organization website) the baseurl must be set to the repository name `baseurl: /swift-macos` in the `docs/_config.yml` file. Therefore, paths in the HTML and Markdown files must start with `/swift-macos`.
