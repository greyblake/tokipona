# Tokipona

Number of tools implemented in ruby to process artificial language [Toki Pona](https://en.wikipedia.org/wiki/Toki_Pona)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "tokipona"
```

## Usage

```ruby
require "tokipona"

# Tokenization
Tokipona::Tokenizer.tokenize("toki mi li toki pona")
# => ["toki", "mi", "li", "toki", "pona"]

```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

