# Jekyll website

The website for this project is at https://gavinw.me/swift-macos. See the sections below to build and run the website locally. The site is built with [Jekyll](https://jekyllrb.com) and hosted with [GitHub Pages](https://pages.github.com) from within the `docs` folder. Since this is a GitHub project website (not a user or organization website) the baseurl must be set to the repository name `baseurl: /swift-macos` in the `docs/_config.yml` file.

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

After installing the Ruby environment, run the Jekyll server from within the `docs` folder using the following command:

```bash
$ bundle exec jekyll serve
```

Bundler and the GitHub Pages gem can be updated with the following commands:

```bash
$ gem update bundler
$ bundle update github-pages
```

## Writing articles

Articles are written as Markdown files located in the `docs/_getting_started`, `docs/_swift`, and `docs/swiftui` folders. Image paths in the Markdown files must start with `/swift-macos`. The front matter for each article contains a `title` field.
