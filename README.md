# ActsAsCategorizable

This gem allows any model to be categorized.

Categories can be defined in a tree structure, allowing items to be structured.
They also support slugs, so they can be used for Semantic URLs.

## Usage (Rails 4+)

Add this line to your application's Gemfile:

```ruby
gem 'acts_as_categorizable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install acts_as_categorizable

## Installation

```
rails g acts-as-categorizable:migration <table_name> # default 'aac_categories'
rake db:migrate
```

## Usage

```ruby
class Page < ActiveRecord::Base
  acts_as_categorizable table_name: 'categories_table', # Default: 'aac_categories'
                        class_name: 'CustomCategory',   # Default: 'ActsAsCategorizable::Category'
                        dependent: :destroy             # Default: :nullify
end
```

## TODO
There are still a lot of things to add to this gem. Consider it as a work in progress.
Some of the missing stuff is:

- Unit testing
- Sortable categories
- Better searching functionality

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/woopasoft/acts_as_categorizable. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org/version/1/3/0/) code of conduct.

## Special mentions
This gem is heavily inspired in [ActsAsMessageable](https://github.com/LTe/acts-as-messageable) and [ActsAsCommentable](https://github.com/jackdempsey/acts_as_commentable)
Thank you guys for publishing your work!

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

