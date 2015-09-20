require "spec_helper"

describe Tokipona::Tokenizer do
  describe ".tokenize" do
    context "only words" do
      it "returns array of words" do
        text = "toki mi li toki pona"
        tokens = described_class.tokenize(text)
        expect(tokens).to eq ["toki", "mi", "li", "toki", "pona"]
      end
    end

    context "words with multiple spaces in between" do
      it "returns array of words" do
        text = "toki   mi   li   toki   pona"
        tokens = described_class.tokenize(text)
        expect(tokens).to eq ["toki", "mi", "li", "toki", "pona"]
      end
    end

    context "words with special characters" do
      it "returns array of words and characters" do
        text = "sina wile lape anu seme, jan lane?"
        tokens = described_class.tokenize(text)
        expect(tokens).to eq ["sina", "wile", "lape", "anu", "seme", ",", "jan", "lane", "?"]
      end
    end

    it "does not change input text" do
      text = "toki mi li pona"
      described_class.tokenize(text)
      expect(text).to eq "toki mi li pona"
    end
  end
end
