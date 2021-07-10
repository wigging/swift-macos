# 🖥 Swift Programming for macOS

There are plenty of books, videos, and online resources for developing iOS apps. Despite the fact that iPhone and iPad apps require a Mac for code development, there is very little information about actually creating native Mac applications. The examples in this repository demonstrate various aspects of Mac app development using the latest versions of Swift and SwiftUI. Hopefully the examples and accompanying website will provide a useful resource for Mac developers.

## Example code

Code files are available in the `examples` folder.

## Website

Website files are in the `docs` folder. View the website at https://gavinw.me/swift-macos.

The website is hosted with [GitHub Pages](https://pages.github.com) and built with [Jekyll](https://jekyllrb.com). To build the website locally, [Bundler](https://bundler.io) is used for the Ruby environment. See the steps below to build a local environment for the website.

**Note:** Since this is a GitHub project website (not a user or organization website) the baseurl must be set to the repository name `baseurl: /swift-macos` in the `docs/_config.yml` file.

```bash
# If not done so already, install Bundler
$ gem install bundler

# Then run Bundler to create a Ruby environment
$ bundle install
```

After installing the Ruby environment, run the Jekyll server from within the `docs` folder using the following command:

```bash
$ bundle exec jekyll serve
```

Bundler and the GitHub Pages gem can be updated with the following commands:

```bash
$ gem update bundler
$ bundle update github-pages
```

## Contributing

Submit a Pull Request if you would like to contribute to this project. Questions and other comments can be submitted on the Issues page.

## Support

Support this project by using the **:heart: Sponsor** button at the top of this page. Thank you :smile:.

## License

Code in this repository is available under the MIT License - see the [LICENSE](LICENSE) file for more information.
