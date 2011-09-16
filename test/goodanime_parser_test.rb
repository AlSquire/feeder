require 'test_helper'
require './goodanime_parser'

class GoodanimeParserTest < Test::Unit::TestCase

  # Expected results from the current fixtures/goodanime_index.html
  def expected_results
    [
      "Itsuka Tenma no Kuro-Usagi Episode 11 (Sub)",
      "Sacred Seven Episode 12 (Raw)",
      "Dantalian no Shoka Episode 10 (Sub)",
      "Kamisama no Memochou Episode 11 (Raw)",
      "Blade Episode 12 (Raw)",
      "Ro-Kyu-Bu! Episode 11 (Raw)",
      "Baka to Test to Shoukanjuu Season 2 Episode 11 (Sub)",
      "Yu-Gi-Oh! Zexal Episode 23 (Sub)",
      "Mawaru Penguindrum Episode 10 (Sub)",
      "The IDOLM@STER Episode 11 (Sub)",
      "Mayo Chiki Episode 11 (Sub)",
      "Pokemon Best Wishes! Episode 50 (Raw)",
      "Pokemon Best Wishes! Episode 49 (Raw)",
      "Hyouge Mono Episode 22 (Raw)",
      "Blood-C Episode 10 (Sub)",
      "Usagi Drop Episode 11 (Sub)",
      "No. 6 Episode 11 (Sub)",
      "Sket Dance Episode 24 (Sub)",
      "Nyanpire The Animation Episode 11 (Raw)",
      "Double-J Episode 10 (Sub)",
      "Twin Angel: Twinkle Paradise Episode 11 (Sub)",
      "Detective Conan Episode 631 (Sub)",
      "Inazuma Eleven Go Episode 20 (Raw)",
      "Morita-san wa Mukuchi Episode 11 (Sub)",
      "Kamisama Dolls Episode 11 (Sub)"
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