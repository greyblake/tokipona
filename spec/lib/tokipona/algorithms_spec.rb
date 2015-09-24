require "spec_helper"

describe Tokipona::Algorithms do
  describe "#levenshtein_distance" do
    def call(str1, str2)
      Tokipona::Algorithms.levenshtein_distance(str1, str2)
    end

    context "strings are equal" do
      it "returns 0" do
        expect(call("", "")).to eq 0
        expect(call("a", "a")).to eq 0
        expect(call("Hello, man!", "Hello, man!")).to eq 0
      end
    end

    context "random different strings" do
      it "returns distance" do
        expect(call("ab", "")).to eq 2
        expect(call("", "xz")).to eq 2
        expect(call("a", "b")).to eq 1
        expect(call("aa", "bb")).to eq 2
        expect(call("a", "bb")).to eq 2
        expect(call("az", "xz")).to eq 1
        expect(call("aa XX bb", "aa oXoX bb")).to eq 2
        expect(call("how are you?", "how R you?")).to eq 3
        expect(call("are you?", "how are u?")).to eq(4 + 2)
      end
    end
  end
end
