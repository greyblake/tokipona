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
    SMILE_REGEXP = /
      (?:
        (?: : | ; | = )                            # eyes
        -?                                         # nose
        (?: \) | \| | \\ | \/ | D | P | p | \* )   # mouth
      ) | (?:x|X)D                                 # indivudal smiles (e.g. XD)
    /x

    WORD_REGEXP = /\w+/

    PUNCTUATION_REGEX = /[^\s]+/

    LEXEME_REGEXP = /#{SMILE_REGEXP}|#{WORD_REGEXP}|#{PUNCTUATION_REGEX}/

    # @param text [String]
    #
    # @return [Array<Hash>]
    def self.tokenize(text)
      new(text).tokenize
    end

    def initialize(text)
      @text = text
    end

    def tokenize
      lexemes = @text.scan(LEXEME_REGEXP)
      lexemes.map { |lex| lexeme_to_token(lex) }
    end

    private def lexeme_to_token(lexeme)
      { lexeme: lexeme, type: token_type(lexeme) }
    end

    private def token_type(lexeme)
      case lexeme
      when SMILE_REGEXP then :smile
      when WORD_REGEXP  then :word
      else :punctuation
      end
    end
  end
end
