require 'test_helper'
require './goodanime_parser'

class GoodanimeParserTest < Test::Unit::TestCase

  # Expected results from the current fixtures/goodanime_index.html
  def expected_results
    [
      {
        :title => "Itsuka Tenma no Kuro-Usagi Episode 11 (Sub)",
        :link  => "http://www.goodanime.net/itsuka-tenma-no-kuro-usagi-episode-11"
      },
      {
        :title => "Sacred Seven Episode 12 (Raw)",
        :link  => "http://www.goodanime.net/sacred-seven-episode-12"
      },
      {
        :title => "Dantalian no Shoka Episode 10 (Sub)",
        :link  => "http://www.goodanime.net/dantalian-no-shoka-episode-10"
      },
      {
        :title => "Kamisama no Memochou Episode 11 (Raw)",
        :link  => "http://www.goodanime.net/kamisama-no-memochou-episode-11"
      },
      {
        :title => "Blade Episode 12 (Raw)",
        :link  => "http://www.goodanime.net/blade-episode-12"
      },
      {
        :title => "Ro-Kyu-Bu! Episode 11 (Raw)",
        :link  => "http://www.goodanime.net/ro-kyu-bu-episode-11"
      },
      {
        :title => "Baka to Test to Shoukanjuu Season 2 Episode 11 (Sub)",
        :link  => "http://www.goodanime.net/baka-to-test-to-shoukanjuu-season-2-episode-11"
      },
      {
        :title => "Yu-Gi-Oh! Zexal Episode 23 (Sub)",
        :link  => "http://www.goodanime.net/yu-gi-oh-zexal-episode-23"
      },
      {
        :title => "Mawaru Penguindrum Episode 10 (Sub)",
        :link  => "http://www.goodanime.net/mawaru-penguindrum-episode-10"
      },
      {
        :title => "The IDOLM@STER Episode 11 (Sub)",
        :link  => "http://www.goodanime.net/the-idolmster-episode-11"
      },
      {
        :title => "Mayo Chiki Episode 11 (Sub)",
        :link  => "http://www.goodanime.net/mayo-chiki-episode-11"
      },
      {
        :title => "Pokemon Best Wishes! Episode 50 (Raw)",
        :link  => "http://www.goodanime.net/pokemon-best-wishes-episode-50"
      },
      {
        :title => "Pokemon Best Wishes! Episode 49 (Raw)",
        :link  => "http://www.goodanime.net/pokemon-best-wishes-episode-49"
      },
      {
        :title => "Hyouge Mono Episode 22 (Raw)",
        :link  => "http://www.goodanime.net/hyouge-mono-episode-22"
      },
      {
        :title => "Blood-C Episode 10 (Sub)",
        :link  => "http://www.goodanime.net/blood-c-episode-10"
      },
      {
        :title => "Usagi Drop Episode 11 (Sub)",
        :link  => "http://www.goodanime.net/usagi-drop-episode-11"
      },
      {
        :title => "No. 6 Episode 11 (Sub)",
        :link  => "http://www.goodanime.net/no-6-episode-11"
      },
      {
        :title => "Sket Dance Episode 24 (Sub)",
        :link  => "http://www.goodanime.net/sket-dance-episode-24"
      },
      {
        :title => "Nyanpire The Animation Episode 11 (Raw)",
        :link  => "http://www.goodanime.net/nyanpire-the-animation-episode-11"
      },
      {
        :title => "Double-J Episode 10 (Sub)",
        :link  => "http://www.goodanime.net/double-j-episode-10"
      },
      {
        :title => "Twin Angel: Twinkle Paradise Episode 11 (Sub)",
        :link  => "http://www.goodanime.net/twin-angel-twinkle-paradise-episode-11"
      },
      {
        :title => "Detective Conan Episode 631 (Sub)",
        :link  => "http://www.goodanime.net/detective-conan-episode-631"
      },
      {
        :title => "Inazuma Eleven Go Episode 20 (Raw)",
        :link  => "http://www.goodanime.net/inazuma-eleven-go-episode-20"
      },
      {
        :title => "Morita-san wa Mukuchi Episode 11 (Sub)",
        :link  => "http://www.goodanime.net/morita-san-wa-mukuchi-episode-11"
      },
      {
        :title => "Kamisama Dolls Episode 11 (Sub)",
        :link  => "http://www.goodanime.net/kamisama-dolls-episode-11"
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