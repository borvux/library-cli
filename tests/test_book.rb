require "minitest/autorun"
require_relative "../book"

class TestBook < Minitest::Test
  def setup
    @book = Book.new("test", "test")
  end

  def test_that_book_is_initialized
    assert_equal "Test", @book.title
    assert_equal "Test", @book.author
    assert_equal false, @book.checked_out
  end

  def test_that_book_checked_out
    @book.check_out
    assert_equal true, @book.checked_out
  end

  def test_that_book_returned
    @book.check_out
    @book.return
    assert_equal false, @book.checked_out
  end

  def test_that_book_to_string
    assert_equal "Test by Test - Available", @book.to_s
  end
end
