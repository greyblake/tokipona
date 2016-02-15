module Tokipona
  class LanguageDetector
    # List of Toki Pona words extracted from https://github.com/x-raizor/visual-tokipona/blob/master/js/tokipona.json
    WORDS = %w(
      a       akesi  ala     ali     ale      anpa     ante   anu    awen   e
      en      ijo    ike     ilo     insa     jaki     jan    jelo   jo     kala
      kalama  kama   kasi    ken     kepeken  kili     kin    kiwen  ko     kon
      kule    kute   kulupu  la      lape     laso     lawa   len    lete   li
      lili    linja  lipu    loje    lon      luka     lukin  lupa   ma     mama
      mani    meli   mi      mije    moku     moli     monsi  mu     mun    musi
      mute    nanpa  nasa    nasin   nena     ni       nimi   noka   o      oko
      olin    ona    open    pakala  pali     palisa   pana   pi     pilin  pimeja
      pini    pipi   poka    poki    pona     sama     seli   selo   seme   jan
      seme    lon    seme    tan     seme     kepeken  nasin  seme   sewi   sijelo
      sike    sin    sina    sinpin  sitelen  sona     kama   sona   soweli suli
      suno    supa   suwi    tan     taso     tawa     telo   tenpo  toki   tomo
      tu      unpa   uta     utala   walo     wan      waso   wawa   weka   wile
    ).freeze

    CONTINENTS = %w(Amelika Antasika Apika Asija Elopa Osejanija).freeze

    COUNTRIES = %w(
      Akanisan    Alan       Alensina       Alensina   Ankola     Anku
      Antola      Awisi      Awisi          Ekuwato    Ekato      Elena
      Eliteja     Epanja     Esalasi        Esi        Esuka      Ilakija
      Ilan        Inli       Intonesija     Isale      Isijopija  Isilan
      Italija     Jamanija   Juke           Kalalinuna Kalalinuna Kalalinuna
      Kamelun     Kana       Kanata         Kanata     Kanpija    Kanpusi
      Kanse       Kapon      Katala         Katelo     Katemala   Katemala
      Kenata      Kenata     Kenja          Kijana     Kijana     Kijanakanse
      Kijanakanse Kine       Kinejekatolija Kinepisa   Kinla      Kiposi
      Kolonpija   Kolonpija  Komo           Kinsasa    Pasawi     Kosalika
      Kosalika    Kosiwa     Kuli           Kupa       Kupa       Kuwasi
      Lanka       Lapewija   Lawi           Lesi       Lesoto     Lijatuwa
      Lipija      Lisensan   Lomani         Losi       Losi       Lowasi
      Lowenki     Lowensina  Lunpan         Lusepu     Luwanta    Maketonija
      Malakasi    Malasija   Malawi         Mali       Malipe     Masu
      Mata        Mesiko     Mesiko         Mewika     Mewika     Mijama
      Monkolu     Mosanpi    Mosijo         Motowa     Mowisi     Mulitanija
      Namipija    Naselija   Nepalu         Netelan    Nijon      Nikalawa
      Nikalawa    Nise       Nosiki         Ontula     Ontula     Pakisan
      Palakawi    Palakawi   Palani         Palata     Panama     Panama
      Panla       Papeto     Papeto         Pasila     Pasila     Pawama
      Pawama      Pelalusi   Pelu           Pelu       Pemuta     Pemuta
      Penen       Penesuwela Penesuwela     Pesije     Pilipina   Pilisin
      Piten       Pokasi     Polipija       Polipija   Posan      Posuka
      Posuwana    Potuke     Pukinapaso     Putan      Samalino   Sameka
      Sameka      Sanpija    Santapiken     Sasali     Sate       Sawasi
      Seki        Seneka     Setapika       Sile       Sile       Silejalijon
      Sinita      Sinita     Sinpapuwe      Sipe       Sipusi     Somalija
      Sonko       Sopisi     Sukosi         Sulija     Suliname   Suliname
      Sumi        Sutan      Sutan          seli       Suwasi     Tansanija
      Tata        Tawan      Tawi           Toko       Tominika   Tominika
      Tosi        Tuki       Tunisi         Ukanta     Ukawina    Ulukawi
      Ulukawi     Uman       Utun           Wasikano   Wensa      Wije
      Tansi
    ).freeze

    CITIES = %w(
      Akajela   Alawa      Anpu     Ansetan  Asina    Ele
      Jelusalen Kenpisi    Kunte    Lanten   Lekawiki Lesinki
      Loma      Mesiko     Milano   Minsen   Munpa    Napoli
      Nujoka    Osaka      Paki     Pakutato Pasen    Pelin
      Peminan   Pesin      Pijenjan Pilense  Putapesi Sakata
      Saloniki  Sanpansiko Sene     Solu     Tape     Telan
      Telawi    Teli       Tokijo   Towano   Wankuwa  Wenesija
    ).freeze

    LANGUAGES = %w(
      Alan      Alapi    Anku       Apikan     Awasa     Awisi
      Elena     Elena    Epanja     Epelanto   Esi       Esuka
      Ilan      Inli     Inli       Insi       Intelinka Intonesija
      Inu       Ipo      Isijopija  Isilan     Italija   Ito
      Iwisi     Jolupa   Kalalinuna Kalike     Kanpusi   Kanse
      Kantun    Katala   Katelo     Kinla      Kisawili  Kuli
      Kusala    Kuwenja  Lasina     Lawi       Lesi      Lijatuwa
      Lolan     Losupan  Lomani     Losi       Lowasi    Lowenki
      Lowensina Lunasimi Luwanta    Maketonija Malakasi  Malasi
      Malasija  Mosijo   Mupe       Netelan    Nijon     Nosiki
      Nosiki    Olapu    Pansapi    Panla      Pasiki    Pasuto
      Pelalusi  Pilipina Pokasi     pona       Posan     Posuka
      Potuke    Sameka   Sami       Sankitu    Sawa      Sawasi
      Seki      Sipe     Sinan      Sintalin   Soma      Somalija
      Sonko     Sopisi   Sowijo     Sumi       Tamasiko  Tami
      Tansi     Tawi     Teluku     Tona       Topisin   Tosi
      Tuki      Ukawina  Utu        Wensa      Wije
    ).freeze

    DOWNCASED_WORDS = WORDS.map(&:downcase).freeze
    DOWNCASED_LANDS = (CONTINENTS + COUNTRIES).map(&:downcase).freeze
    DOWNCASED_LANGUAGES = LANGUAGES.map(&:downcase)


    TRESHOLD = 0.7


    def self.toki_pona?(text)
      new(text).toki_pona?
    end

    def initialize(text)
      @text = text
    end

    def toki_pona?
      tokens = Tokenizer.tokenize(@text)
      tokiponity(tokens) > TRESHOLD
    end

    # Calculate probability of Toki Pona sentence.
    def tokiponity(tokens)
      weight_sum = 0
      word_count = 0

      word_tokens = tokens.select { |token| token[:type] == :word }

      word_tokens.each_with_index do |token, index|
        word = token[:lexeme].downcase

        # Regular word
        if DOWNCASED_WORDS.include?(word)
          weight_sum += 1

        # Person's name
        elsif index > 0 && tokens[index-1][:lexeme] == 'jan'
          weight_sum += 1

        # Continent or country
        elsif index > 0 && tokens[index-1][:lexeme] == 'ma'
          if  DOWNCASED_LANDS.include?(word)
            weight_sum += 1
          elsif levenshtein(word, DOWNCASED_LANDS) == 1
            weight_sum += 0.5
          end

        # Language
        elsif index > 0 && tokens[index-1][:lexeme] == 'toki'
          if DOWNCASED_LANGUAGES.include?(word)
            weight_sum += 1
          elsif levenshtein(word, DOWNCASED_LANGUAGES) == 1
            weight_sum += 0.5
          end

        # City
        elsif index > 1 && tokens[index-2][:lexeme] == 'ma' && tokens[index-1][:lexeme] == 'tomo'
          weight_sum += 1

        elsif levenshtein(word, DOWNCASED_WORDS) <= 1
          weight_sum += 0.5
        end
        word_count += 1
      end

      weight_sum.to_f / word_count
    end

    def levenshtein(downcased_word, set)
      distances = set.map do |toki_pona_word|
        Algorithms.levenshtein_distance(toki_pona_word, downcased_word)
      end
      distances.min
    end
  end
end



