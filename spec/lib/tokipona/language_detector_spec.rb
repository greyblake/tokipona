require "spec_helper"

describe Tokipona::LanguageDetector do
  describe ".toki_pona?" do
    toki_phrases = [
      "weka*",
      "pona!",
      "mi lon",
      "mi sona",
      "pona :)",
      "toki sin",
      "toki =:D",
      "toki toki",
      "a mi sona",
      "toki kin a",
      "toki: losi",
      "ma Mewika~",
      "nimi seme?",
      "ni li seme?",
      "mi weka lili",
      "mi tawa lape",
      "mi tawa moku",
      "moku pona :)",
      "tan ma Mewika",
      "toki jan zebst",
      "mi lon moku!!!",
      "pona ala pona?",
      "toki jan norayr",
      "sina tawa lape?",
      "ona li toki =:9",
      "ni li lon ala xD",
      "mi wile moku kin.",
      "sina tan ma seme?",
      "insa li pilin ike",
      "nimi \"en\" li ni ala",
      "lape pona, jan lane",
      "lape pona, tawa pona",
      "jan lane o, moki pona! ",
      "mi jan sin pi toki pona.",
      "mi pilin e ni: sina tawa",
      "or: - li joe lawa ala. :)",
      "mi sona e ale pi toki pona",
      "toki Losupan mi li nasa =:s",
      "mi lukin e toki sina. mi sona",
      "mi pilin e ni. sina sona mute.",
      "pipi jaki lili ala, mi jo e kiwen",
      "o jan Rnuomer, sina pali seme? :3",
      "mi kama sona e sitelen sitelen :3",
      "jan Losi li lukin sama jan Mewika.",
      "jan Losi li lukin sama soweli seme?",
      "tenpo kama la mi mute li wile toki :)",
      "o jan rnuomer, minetest li jo e soweli?",
      "mi lon ona kepeken nimi sama nimi lon ni.",
      "mi sona ala la seme pali e ilo sitelen....",
      "lol \"Toki, mi jan Ton, en mi jan wile wawa\"",
      "tenpo pini la mi sitelen e sitelen lon tomo sona",
      "suno pini, mi toki jan pona e ni: ona li wile kama sona e toki pona",
    ]

    non_toki_phrases = [
      "Maybe",
      "stupid*",
      "neat =:9",
      "done, gg",
      "oh, yeah",
      "of the IDE",
      "toki: pata",
      "toki: return",
      "Tute = twitter",
      "in what context",
      "my internet dropped",
      "you gets a tiny head",
      "it's great isn't it?",
      "it can be comparative",
      "AAAAAAAAAAAAAAAAAAAAAA",
      "like a want to know...",
      "that was embarassing...",
      "Katelo = Georgia, Georgian",
      "i'll send you the login pm",
      "I'm working on it still :x",
      "\"for now I am away eating*\"",
      "Lesson 4? Of Pije's lessons?",
      "vivi, how I work this thing?",
      "i still don't understand, sorry",
      "tolrinju: what are you regexxing",
      "for example sitting at the table",
      "I am not mute pona at speaking it",
      "I'd say something like tomo sike tu",
      "mi pilin pona e ni = I feel well this",
      "not enough toki pona too much english xD",
      "lo nu mulno sisku zo'u: y no da se tolcri",
      "Unless you say you want to talk about someone",
      "toki pona's numbering system is fucking ridiculous",
      "just realized tanpon could be a toki pona word lol",
      "like speciall debian since they just have packages...",
      "But that's not used today, is it? First time I see it.",
      "is that: again I start work during the day. work time doesn't end?",
      "palkeo: I got lost. What's the intended meaning you're translating?",
      "my self esteem is a black hole....it sucks every one in...no homo.....",
      "imbo it's best not to think \"how do I say this english thing in toki pona\"",
      "you know what would be nice... toki pona translations of the wiki pages lol",
    ]

    toki_phrases.each do |phrase|
      context "for phrase:   #{phrase}  " do
        it "returns true" do
          expect(described_class.toki_pona?(phrase)).to eq true
        end
      end
    end

    non_toki_phrases.each do |phrase|
      context "for phrase:   #{phrase}   " do
        it "returns false" do
          expect(described_class.toki_pona?(phrase)).to eq false
        end
      end
    end

  end
end
