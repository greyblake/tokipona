require "spec_helper"

describe Tokipona::Tokenizer do
  describe ".tokenize" do
    context "only words" do
      it "returns array of words" do
        text = "toki mi li toki pona"
        tokens = described_class.tokenize(text)
        expect(tokens).to eq [
          { lexeme: "toki", type: :word },
          { lexeme: "mi"  , type: :word },
          { lexeme: "li"  , type: :word },
          { lexeme: "toki", type: :word },
          { lexeme: "pona", type: :word }
        ]
      end
    end

    context "words with multiple spaces in between" do
      it "returns array of words" do
        text = "toki   mi   \nli   toki   pona"
        tokens = described_class.tokenize(text)
        expect(tokens).to eq [
          { lexeme: "toki", type: :word },
          { lexeme: "mi"  , type: :word },
          { lexeme: "li"  , type: :word },
          { lexeme: "toki", type: :word },
          { lexeme: "pona", type: :word }
        ]
      end
    end

    context "words with punctuations" do
      it "returns array of words and punctuations" do
        text = "pona. toki e mi, anu seme?"
        tokens = described_class.tokenize(text)
        expect(tokens).to eq [
          { lexeme: "pona", type: :word }        ,
          { lexeme: "."   , type: :punctuation } ,
          { lexeme: "toki", type: :word }        ,
          { lexeme: "e"   , type: :word },
          { lexeme: "mi"  , type: :word },
          { lexeme: ","   , type: :punctuation },
          { lexeme: "anu" , type: :word },
          { lexeme: "seme", type: :word },
          { lexeme: "?"   , type: :punctuation }
        ]
      end
    end

    context "words, punctuations and smiles" do
      it "handles smiles" do
        smiles = [";)", ":-)", ":D", ":-/"]
        base_text = "toki. pona "

        smiles.each do |smile|
          text = base_text + smile
          tokens = described_class.tokenize(text)
          expect(tokens).to eq [
            { lexeme: "toki", type: :word },
            { lexeme: "."   , type: :punctuation } ,
            { lexeme: "pona", type: :word }        ,
            { lexeme: smile, type: :smile }        ,
          ]
        end
      end
    end

    it "does not change input text" do
      text = "toki mi li pona"
      described_class.tokenize(text)
      expect(text).to eq "toki mi li pona"
    end
  end
end
