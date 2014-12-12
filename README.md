# ValidatesAssociatedBubbling

This Gem is based on the question/answer in this [Stackoverflow discussion](http://stackoverflow.com/questions/7387459/validates-associated-with-models-error-message). 

It's purpose is to add an associations validation error messages to the parent model.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'validates_associated_bubbling'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validates_associated_bubbling

## Usage

Add this line to a model that has associations:

```ruby
class SomeModel < ActiveRecord::Base
  validates_associated_bubbling :association1, :association2_or_more, unless: :some_predicate
end
```

Same options available as other validation class methods.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/validates_associated_bubbling/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
