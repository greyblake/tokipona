module Tokipona
  module Algorithms
    extend self

    class LeveshteinDistance
      def initialize(str1, str2)
        @str1 = str1
        @str2 = str2
        @cache = Array.new(str1.size + 1) { [] }
      end

      def execute(l1 = nil, l2 = nil)
        l1 ||= @str1.size
        l2 ||= @str2.size

        i1 = l1 - 1
        i2 = l2 - 1

        return @cache[i1][i2] if @cache[i1][i2]

        return 0 if @str1 == @str2

        return l2 if l1 == 0
        return l1 if l2 == 0

        cost = (@str1[i1] == @str2[i2]) ? 0 : 1
        arr = [
          execute(l1, l2 - 1) + 1,
          execute(l1 - 1, l2) + 1,
          execute(l1 - 1, l2 - 1) + cost
        ]

        @cache[i1][i2] = arr.min
      end
    end

    def levenshtein_distance(str1, str2)
      LeveshteinDistance.new(str1, str2).execute
    end

    def dist(s, t)
      d = Array.new
    end
  end
end
