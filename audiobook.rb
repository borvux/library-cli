# audiobook.rb

require_relative "book"

class Audiobook < Book
  attr_reader :narrator, :duration

  def initialize(title, author, narrator, duration, checked_out = false)
    super(title, author, checked_out)
    self.narrator = narrator
    self.duration = duration
  end

  def narrator=(input)
    raise "Narrator cannot be blank" if input.blank?
    @narrator = input.titleize
  end

  def duration=(input)
    raise "Duration must be greater than 0" unless input.positive?
    @duration = input
  end

  def formatted_duration
    total_minutes = @duration
    hours = total_minutes / 60
    minutes = total_minutes % 60

    if hours < 1
      "#{minutes} #{"minute".pluralize(minutes)}"
    else
      "#{hours} #{"hour".pluralize(hours)} and #{minutes} #{"minute".pluralize(minutes)}"
    end
  end

  def to_s 
     "#{title} by #{author}, Narrator: #{narrator}, Duration: #{formatted_duration} - #{@checked_out ? "Checked out" : "Available"}"
  end
end
