require './spec/spec_helper'
require './goodanime_parser'

describe GoodanimeParser do

  # Expected results from the current fixtures/vcr_cassettes/goodanime.yml
  def expected_results
    [
      {
        :title => "Pokemon Season 15 BW Rival Destinies Episode 13 (Dub)",
        :link  => "http://www.goodanime.net/pokemon-season-15-bw-rival-destinies-episode-13",
        :guid  => "pokemon-season-15-bw-rival-destinies-episode-13-dub"
      },
      {
        :title => "Pokemon Season 15 BW Rival Destinies Episode 12 (Dub)",
        :link  => "http://www.goodanime.net/pokemon-season-15-bw-rival-destinies-episode-12",
        :guid  => "pokemon-season-15-bw-rival-destinies-episode-12-dub"
      },
      {
        :title => "Hyouka Episode 4 (Raw)",
        :link  => "http://www.goodanime.net/hyouka-episode-4",
        :guid  => "hyouka-episode-4-raw"
      },
      {
        :title => "Saki: Achiga-hen Episode 6 (Sub)",
        :link  => "http://www.goodanime.net/saki-achiga-hen-episode-6",
        :guid  => "saki-achiga-hen-episode-6-sub"
      },
      {
        :title => "Tasogare Otome x Amnesia Episode 6 (Raw)",
        :link  => "http://www.goodanime.net/tasogare-otome-x-amnesia-episode-6",
        :guid  => "tasogare-otome-x-amnesia-episode-6-raw"
      },
      {
        :title => "Toriko Episode 56 (Raw)",
        :link  => "http://www.goodanime.net/toriko-episode-56",
        :guid  => "toriko-episode-56-raw"
      },
      {
        :title => "Nazo no Kanojo X Episode 6 (Sub)",
        :link  => "http://www.goodanime.net/nazo-no-kanojo-x-episode-6",
        :guid  => "nazo-no-kanojo-x-episode-6-sub"
      },
      {
        :title => "Arashi no Yoru ni: Himitsu no Tomodachi Episode 4 (Sub)",
        :link  => "http://www.goodanime.net/arashi-no-yoru-ni-himitsu-no-tomodachi-episode-4",
        :guid  => "arashi-no-yoru-ni-himitsu-no-tomodachi-episode-4-sub"
      },
      {
        :title => "AKB0048 Episode 3 (Raw)",
        :link  => "http://www.goodanime.net/akb0048-episode-3",
        :guid  => "akb0048-episode-3-raw"
      },
      {
        :title => "Phi Brain: Kami no Puzzle Episode 31 (Raw)",
        :link  => "http://www.goodanime.net/phi-brain-kami-no-puzzle-episode-31",
        :guid  => "phi-brain-kami-no-puzzle-episode-31-raw"
      },
      {
        :title => "Gundam AGE Episode 31 (Raw)",
        :link  => "http://www.goodanime.net/gundam-age-episode-31",
        :guid  => "gundam-age-episode-31-raw"
      },
      {
        :title => "Acchi Kocchi Episode 6 (Sub)",
        :link  => "http://www.goodanime.net/acchi-kocchi-episode-6",
        :guid  => "acchi-kocchi-episode-6-sub"
      },
      {
        :title => "Hiiro no Kakera Episode 7 (Sub)",
        :link  => "http://www.goodanime.net/hiiro-no-kakera-episode-7",
        :guid  => "hiiro-no-kakera-episode-7-sub"
      },
      {
        :title => "Saint Seiya Omega Episode 7 (Raw)",
        :link  => "http://www.goodanime.net/saint-seiya-omega-episode-7",
        :guid  => "saint-seiya-omega-episode-7-raw"
      },
      {
        :title => "Uchuu Kyoudai Episode 7 (Sub)",
        :link  => "http://www.goodanime.net/uchuu-kyoudai-episode-7",
        :guid  => "uchuu-kyoudai-episode-7-sub"
      },
      {
        :title => "Hunter X Hunter 2011 Episode 31 (Sub)",
        :link  => "http://www.goodanime.net/hunter-x-hunter-2011-episode-31",
        :guid  => "hunter-x-hunter-2011-episode-31-sub"
      },
      {
        :title => "One Piece episode 547 (Sub)",
        :link  => "http://www.goodanime.net/one-piece-episode-547",
        :guid  => "one-piece-episode-547-sub"
      },
      {
        :title => "Pretty Rhythm Aurora Dream Special 4 (Sub)",
        :link  => "http://www.goodanime.net/pretty-rhythm-aurora-dream-special-4",
        :guid  => "pretty-rhythm-aurora-dream-special-4-sub"
      },
      {
        :title => "Pretty Rhythm Aurora Dream Special 3 (Sub)",
        :link  => "http://www.goodanime.net/pretty-rhythm-aurora-dream-special-3",
        :guid  => "pretty-rhythm-aurora-dream-special-3-sub"
      },
      {
        :title => "Folktales from Japan Episode 7 (Sub)",
        :link  => "http://www.goodanime.net/folktales-from-japan-episode-7",
        :guid  => "folktales-from-japan-episode-7-sub"
      },
      {
        :title => "Poyopoyo Kansatsu Nikki Episode 19 (Sub)",
        :link  => "http://www.goodanime.net/poyopoyo-kansatsu-nikki-episode-19",
        :guid  => "poyopoyo-kansatsu-nikki-episode-19-sub"
      },
      {
        :title => "Kuroko no Basuke Episode 6 (Sub)",
        :link  => "http://www.goodanime.net/kuroko-no-basuke-episode-6",
        :guid  => "kuroko-no-basuke-episode-6-sub"
      },
      {
        :title => "Avatar: The Legend of Korra Episode 6 (Dub)",
        :link  => "http://www.goodanime.net/avatar-the-legend-of-korra-episode-6",
        :guid  => "avatar-the-legend-of-korra-episode-6-dub"
      },
      {
        :title => "Fate Zero S2 Episode 6 (Sub)",
        :link  => "http://www.goodanime.net/fate-zero-s2-episode-6",
        :guid  => "fate-zero-s2-episode-6-sub"
      },
      {
        :title => "Moretsu Pirates Episode 19 (Sub)",
        :link  => "http://www.goodanime.net/moretsu-pirates-episode-19",
        :guid  => "moretsu-pirates-episode-19-sub"
      }
    ]
  end

  def goodanime_html
    VCR.use_cassette('goodanime') do
      open('http://goodanime.net/') #.to_s
    end
  end

  before do
    @html = goodanime_html
    @parser = GoodanimeParser.new(@html)
  end

  it "have the given html source" do
    @parser.html_source.must_equal @html
  end

  it "parse html source for the expected number of results" do
    @parser.results.count.must_equal expected_results.size
  end

  it "parse html source for the expected results" do
    @parser.results.must_equal expected_results
  end
end