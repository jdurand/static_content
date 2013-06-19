# Static Content

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

    Content.create({slug: :about_title, text: "My awesome about page"}, as: :admin)

special attention to the `as: :admin`, the fields is only acessible to `admin`.

This is intended to be used with admin panels such as Typus or ActiveAdmin.

#### The better way

The better way is to use the `Content.from_slug` like:

    Content.from_slug(:about_title, default: "My awesome about page")

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

## Warning

Static Content generates a model [`Content`](https://github.com/Helabs/static_content/blob/master/app/models/content.rb) and a table [`contents`](https://github.com/Helabs/static_content/blob/master/db/migrate/20120705141451_create_contents.rb), so your app should not contain this model and table.

## Versioning

Static Content follow the [Semantic Versioning](http://semver.org/).

## Issues

If you have problems, please create a [Github Issue](https://github.com/Helabs/rails-template/issues).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
