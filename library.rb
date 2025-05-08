# library.rb

require_relative "audiobook"

class Library
  attr_reader :items

  def initialize(items = [])
    @items = items
  end

  def add_item(item)
    @items.push(item)
  end

  def check_out_item(title)
    item = self.search_by_title(title)

    if item.nil?
      raise "Item not found"
    else
      item.check_out
    end
  end

  def return_item(title)
    item = self.search_by_title(title)

    if item.nil?
      raise "Item not found"
    else
      item.return
    end
  end

  private

  def search_by_title(title)
    @items.find { |item| item.title == title }
  end
end
