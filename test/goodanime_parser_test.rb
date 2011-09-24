require 'test_helper'
require './goodanime_parser'

class GoodanimeParserTest < Test::Unit::TestCase

  # Expected results from the current fixtures/goodanime_index.html
  def expected_results
    [
      {
        :title => "Itsuka Tenma no Kuro-Usagi Episode 11 (Sub)",
        :link  => "http://www.goodanime.net/itsuka-tenma-no-kuro-usagi-episode-11",
        :guid  => "itsuka-tenma-no-kuro-usagi-episode-11-sub"
      },
      {
        :title => "Sacred Seven Episode 12 (Raw)",
        :link  => "http://www.goodanime.net/sacred-seven-episode-12",
        :guid  => "sacred-seven-episode-12-raw"
      },
      {
        :title => "Dantalian no Shoka Episode 10 (Sub)",
        :link  => "http://www.goodanime.net/dantalian-no-shoka-episode-10",
        :guid  => "dantalian-no-shoka-episode-10-sub"
      },
      {
        :title => "Kamisama no Memochou Episode 11 (Raw)",
        :link  => "http://www.goodanime.net/kamisama-no-memochou-episode-11",
        :guid  => "kamisama-no-memochou-episode-11-raw"
      },
      {
        :title => "Blade Episode 12 (Raw)",
        :link  => "http://www.goodanime.net/blade-episode-12",
        :guid  => "blade-episode-12-raw"
      },
      {
        :title => "Ro-Kyu-Bu! Episode 11 (Raw)",
        :link  => "http://www.goodanime.net/ro-kyu-bu-episode-11",
        :guid  => "ro-kyu-bu-episode-11-raw"
      },
      {
        :title => "Baka to Test to Shoukanjuu Season 2 Episode 11 (Sub)",
        :link  => "http://www.goodanime.net/baka-to-test-to-shoukanjuu-season-2-episode-11",
        :guid  => "baka-to-test-to-shoukanjuu-season-2-episode-11-sub"
      },
      {
        :title => "Yu-Gi-Oh! Zexal Episode 23 (Sub)",
        :link  => "http://www.goodanime.net/yu-gi-oh-zexal-episode-23",
        :guid  => "yu-gi-oh-zexal-episode-23-sub"
      },
      {
        :title => "Mawaru Penguindrum Episode 10 (Sub)",
        :link  => "http://www.goodanime.net/mawaru-penguindrum-episode-10",
        :guid  => "mawaru-penguindrum-episode-10-sub"
      },
      {
        :title => "The IDOLM@STER Episode 11 (Sub)",
        :link  => "http://www.goodanime.net/the-idolmster-episode-11",
        :guid  => "the-idolmster-episode-11-sub"
      },
      {
        :title => "Mayo Chiki Episode 11 (Sub)",
        :link  => "http://www.goodanime.net/mayo-chiki-episode-11",
        :guid  => "mayo-chiki-episode-11-sub"
      },
      {
        :title => "Pokemon Best Wishes! Episode 50 (Raw)",
        :link  => "http://www.goodanime.net/pokemon-best-wishes-episode-50",
        :guid  => "pokemon-best-wishes-episode-50-raw"
      },
      {
        :title => "Pokemon Best Wishes! Episode 49 (Raw)",
        :link  => "http://www.goodanime.net/pokemon-best-wishes-episode-49",
        :guid  => "pokemon-best-wishes-episode-49-raw"
      },
      {
        :title => "Hyouge Mono Episode 22 (Raw)",
        :link  => "http://www.goodanime.net/hyouge-mono-episode-22",
        :guid  => "hyouge-mono-episode-22-raw"
      },
      {
        :title => "Blood-C Episode 10 (Sub)",
        :link  => "http://www.goodanime.net/blood-c-episode-10",
        :guid  => "blood-c-episode-10-sub"
      },
      {
        :title => "Usagi Drop Episode 11 (Sub)",
        :link  => "http://www.goodanime.net/usagi-drop-episode-11",
        :guid  => "usagi-drop-episode-11-sub"
      },
      {
        :title => "No. 6 Episode 11 (Sub)",
        :link  => "http://www.goodanime.net/no-6-episode-11",
        :guid  => "no-6-episode-11-sub"
      },
      {
        :title => "Sket Dance Episode 24 (Sub)",
        :link  => "http://www.goodanime.net/sket-dance-episode-24",
        :guid  => "sket-dance-episode-24-sub"
      },
      {
        :title => "Nyanpire The Animation Episode 11 (Raw)",
        :link  => "http://www.goodanime.net/nyanpire-the-animation-episode-11",
        :guid  => "nyanpire-the-animation-episode-11-raw"
      },
      {
        :title => "Double-J Episode 10 (Sub)",
        :link  => "http://www.goodanime.net/double-j-episode-10",
        :guid  => "double-j-episode-10-sub"
      },
      {
        :title => "Twin Angel: Twinkle Paradise Episode 11 (Sub)",
        :link  => "http://www.goodanime.net/twin-angel-twinkle-paradise-episode-11",
        :guid  => "twin-angel-twinkle-paradise-episode-11-sub"
      },
      {
        :title => "Detective Conan Episode 631 (Sub)",
        :link  => "http://www.goodanime.net/detective-conan-episode-631",
        :guid  => "detective-conan-episode-631-sub"
      },
      {
        :title => "Inazuma Eleven Go Episode 20 (Raw)",
        :link  => "http://www.goodanime.net/inazuma-eleven-go-episode-20",
        :guid  => "inazuma-eleven-go-episode-20-raw"
      },
      {
        :title => "Morita-san wa Mukuchi Episode 11 (Sub)",
        :link  => "http://www.goodanime.net/morita-san-wa-mukuchi-episode-11",
        :guid  => "morita-san-wa-mukuchi-episode-11-sub"
      },
      {
        :title => "Kamisama Dolls Episode 11 (Sub)",
        :link  => "http://www.goodanime.net/kamisama-dolls-episode-11",
        :guid  => "kamisama-dolls-episode-11-sub"
      }
    ]
  end

  def setup
    @goodanime_html = File.read('test/fixtures/goodanime_index.html')
    @parser = GoodanimeParser.new(@goodanime_html)
  end

  def test_html_source
    assert_equal @goodanime_html, @parser.html_source
  end

  def test_results_count
    assert_equal 25, @parser.results.count
  end

  def test_results
    assert_equal expected_results, @parser.results
  end
end