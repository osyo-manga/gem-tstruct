[![Build Status](https://travis-ci.org/osyo-manga/gem-tstruct.svg?branch=master)](https://travis-ci.org/osyo-manga/gem-tstruct)

# TStruct

`TStruct` is type checked `Struct`


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tstruct'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install tstruct

## Usage

```ruby
require "tstruct"

# propaty names with Type
# Type must has `#===`
User = TStruct.new(id: Integer, name: String, age: Integer)

homu = User.new(1, "homu", 14)

# OK
homu.name = "homuhomu"

# error: TypeError
homu.age = "14"


```

```ruby
require "tstruct"

# Use Regexp and Range
User = TStruct.new(id: Integer, name: /^h/, age: (1..20))

homu = User.new(1, "homu", 14)

# error: TypeError
homu.name = "mami"

# OK
homu.age = 15

# error: TypeError
homu.age = 21
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/osyo-manga/gem-tstruct.

