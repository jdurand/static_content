# Static Content
[![RubyGems][gem_version_badge]][ruby_gems]
[![Travis CI][travis_ci_badge]][travis_ci]
[![Coveralls][coveralls_badge]][coveralls]
[![Code Climate][code_climate_badge]][code_climate]
[![Gemnasium][gemnasium_badge]][gemnasium]

Static Content provides an easy way of defining static content in your application.

## Installation

Add this line to your application's Gemfile:

    gem 'static_content'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install static_content

After install the gem, you just need run the install generator:

    $ rails g static_content:install

## Usage

### Creating content

The content we create can be normal text or a markdown. Let`s see the way we can create a content.

#### Standard Way

You can create as a normal model with:

    StaticContent::Content.create({slug: :about_title, text: "My awesome about page"}, as: :admin)

special attention to the `as: :admin`, the fields is only acessible to `admin`.

This is intended to be used with admin panels such as Typus or ActiveAdmin.

#### The better way

The better way is to use the `StaticContent::Content.from_slug` like:

    StaticContent::Content.from_slug(:about_title, default: "My awesome about page")

as this uses `find_or_initialize`, if is a new `slug` its create, if a old one its only return the value not raising a error.

So you can use this on a seed for example to create the default things.

### Showing content

#### content

Show your content as html converted from markdown, in your view, just add:

```
<%= c :about_title, default: "# My awesome about page" %>
```

to be converted into

```
<h1>My awesome about page</h1>
```

Please note that a `default` option is required. If it hasn't been created, it will be created upon the first request.

#### raw content

Show your raw content, in your view, just add:

```
<%= rc :about_title, default: "# My awesome about page" %>
```

no change the value as

```
# My awesome about page
```

Please note that a `default` option is required. If it hasn't been created, it will be created upon the first request.

## Versioning

Static Content follow the [Semantic Versioning](http://semver.org/).

## Issues

If you have problems, please create a [Github Issue](https://github.com/Helabs/static_content/issues).

## Contributing

Please see [CONTRIBUTING.md](https://github.com/Helabs/static_content/blob/master/CONTRIBUTING.md) for details.

## Credits

Static Content is maintained and funded by [HE:labs](http://helabs.com.br/opensource/).
Thank you to all the [contributors](https://github.com/Helabs/static_content/graphs/contributors).

[gem_version_badge]: https://badge.fury.io/rb/static_content.png
[ruby_gems]: http://rubygems.org/gems/static_content
[code_climate]: https://codeclimate.com/github/Helabs/static_content
[code_climate_badge]: https://codeclimate.com/github/Helabs/static_content.png
[travis_ci]: http://travis-ci.org/Helabs/static_content
[travis_ci_badge]: https://secure.travis-ci.org/Helabs/static_content.png
[gemnasium]: https://gemnasium.com/Helabs/static_content
[gemnasium_badge]: https://gemnasium.com/Helabs/static_content.png
[coveralls]: https://coveralls.io/r/Helabs/static_content
[coveralls_badge]: https://coveralls.io/repos/Helabs/static_content/badge.png?branch=master
