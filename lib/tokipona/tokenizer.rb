module Tokipona
  class Tokenizer
    def self.tokenize(text)
      new(text).tokenize
    end

    def initialize(text)
      @text = text
      @tokens = []
      @current_token = ""
    end

    def tokenize
      @text.each_char do |char|
        process_char(char)
      end

      # Add the latest token to @tokens
      add_token!

      @tokens
    end

    private def process_char(char)
      case char
      when "a".."z", "A".."Z"
        @current_token << char
      when " "
        add_token!
      else
        # Any other character we consider as a separate token
        add_token!
        @current_token << char
      end
    end

    private def add_token!
      if !@current_token.empty?
        @tokens << @current_token
        @current_token = ""
      end
    end
  end
end
