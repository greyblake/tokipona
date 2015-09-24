module Tokipona
  # Splits text into tokens (words, punctuations and smiles).
  #
  # @example
  #   Tokipona::Tokenizer.tokenize("pona. anu seme? :D")
  #   # => [
  #   #  { lexeme: "pona", type: :word },
  #   #  { lexeme: "."   , type: punctuation },
  #   #  { lexeme: "anu" , type: :word },
  #   #  { lexeme: "seme", type: :word },
  #   #  { lexeme: "?"   , type: :punctuation},
  #   #  { lexeme: ":D"  , type: :smile},
  #   # ]
  class Tokenizer
    WORD_REGEXP = /\w+/
    SMILE_REGEXP = /
      (?:
        (?: : | ; | = )
        -?
        (?: \) | \| | \\ | \/ | D | P | p )
      ) | (?:x|X)D
    /x

    PUNCTUATION_REGEX = /[^\s]/
    TOKEN_REGEXP = /#{WORD_REGEXP}|#{SMILE_REGEXP}|#{PUNCTUATION_REGEX}/

    # @param text [String]
    #
    # @return [Array<String>]
    def self.tokenize(text)
      new(text).tokenize
    end

    def initialize(text)
      @text = text
    end

    def tokenize
      lexemes = @text.scan(TOKEN_REGEXP)
      lexemes.map { |lex| lexeme_to_token(lex) }
    end

    private def lexeme_to_token(lexeme)
      {
        lexeme: lexeme,
        type: token_type(lexeme)
      }
    end

    private def token_type(lexeme)
      if lexeme =~ SMILE_REGEXP
        :smile
      elsif lexeme =~ WORD_REGEXP
        :word
      else
        :punctuation
      end
    end
  end
end
