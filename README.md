# Swift Programming for macOS

:apple: :computer:

There are plenty of books, videos, and online resources for developing iOS apps. Despite the fact that iPhone and iPad apps require a Mac for code development, there is very little information about actually creating native Mac applications. The examples in this repository demonstrate various aspects of Mac app development using the latest versions of Swift and SwiftUI. Hopefully the examples will provide a useful resource for Mac developers.

**Examples:** Xcode projects and Playgrounds are located in the **code** folder.

**Website:** https://gavinw.me/swift-macos

## Building the website

The website is built with [Jekyll](https://jekyllrb.com) and hosted with [GitHub Pages](https://pages.github.com) from within the **docs** folder. [Bundler](https://bundler.io) is used for the Ruby environment. See the steps below to build the website locally; otherwise GitHub will automatically build the site after a push event.

If not done so already, install Bundler:

```bash
$ gem install bundler
```

Next, create a GitHub Pages Gemfile by following the instructions at [github.com/github/pages-gem](https://github.com/github/pages-gem):

```
source 'https://rubygems.org'
gem 'github-pages', group: :jekyll_plugins
```

Create the Ruby environment for the project:

```bash
$ bundle install
```

Run the Jekyll server with the following command:

```bash
$ bundle exec jekyll serve
```

Update the Ruby Bundler gem and the GitHub pages gem:

```bash
$ gem update bundler
$ bundle update github-pages
```

## Writing posts

Posts are written as Markdown files located in the **docs/_posts** folder. Since this is a project website (not a user or organization website) the baseurl must be set to the repository name `baseurl: /swift-macos` in the `docs/_config.yml` file. Therefore, paths in the HTML and Markdown files must start with `/swift-macos`.

## Contributing

Submit a Pull Request if you would like to contribute to this project. Questions and other comments can be submitted on the Issues page.

## Support

Support this project by using the **:heart: Sponsor** button at the top of this page. Thank you :smile:.

## License

Code in this repository is available under the MIT License - see the [LICENSE](LICENSE) file for more information.
