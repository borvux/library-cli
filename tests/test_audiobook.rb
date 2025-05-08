require "minitest/autorun"
require_relative "../audiobook"

class TestAudiobook < Minitest::Test
  def setup
    @audiobook = Audiobook.new("title", "author", "narrator", 100)
  end

  def test_that_audiobook_is_initialized
    assert_equal "Title", @audiobook.title
    assert_equal "Author", @audiobook.author
    assert_equal "Narrator", @audiobook.narrator
    assert_equal 100, @audiobook.duration
    assert_equal false, @audiobook.checked_out
  end

  def test_formatted_duration
    assert_equal "1 hour and 40 minutes", @audiobook.formatted_duration
   
    @audiobook.duration = 1
    assert_equal "1 minute", @audiobook.formatted_duration

    @audiobook.duration = 62
    assert_equal "1 hour and 2 minutes", @audiobook.formatted_duration
  end

  def test_to_s
    assert_equal "Title by Author, Narrator: Narrator, Duration: 1 hour and 40 minutes - Available", @audiobook.to_s
  end
end

