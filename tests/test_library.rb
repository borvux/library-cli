require "minitest/autorun"
require_relative "../library"

class TestLibrary < Minitest::Test
  def setup
    @library = Library.new()
  end

  def test_initialized
    assert_equal 0, @library.items.length
  end

  def test_add_item
    @library.add_item(Book.new("The Hobbit", "JRR Tolkien"))
    assert_equal 1, @library.items.length

    @library.add_item(Audiobook.new("The Hobbit", "JRR Tolkien", "Benny", 1230))
    assert_equal 2, @library.items.length
  end
end
