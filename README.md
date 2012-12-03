# TemplateSwitcher

Rails template switcher.

## Installation

Add this line to your application's Gemfile:

    gem 'template-switcher'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install template-switcher

## Usage

config/initializer/template\_switcher.rb
```ruby
TemplateSwitcher.mapping = {
  "abc.example.domain" => "abc_views",
  "xyz.example.domain" => "xyz_views",
}
```

app/controllers/posts_controller.rb
```ruby
class PostsController < ApplicationController
  include TemplateSwitcher::AutoRenderSwitcher

  def index
    render "index"
  end

  private
  def template_selector
    request.host
  end
end
```

If requested host name is "abc.example.domain", rendered "app/abc_views/posts/index.html.haml".
If requested host name is "xyz.example.domain", rendered "app/xyz_views/posts/index.html.haml".
Otherwize, rendered "app/views/posts/index.html.haml".

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
