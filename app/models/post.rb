# Clickbait attribute being validated
class ClickbaitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # Regex, matches a string followed by (b|c)
    # The \d matches a single character that is a digit (Top 10)
    # =~ operator matches regex against a string
    # the i at the end makes the expression case insensitive
    unless value =~ /(Won't Believe|Secret|Top \d|Guess)/i
      record.errors[attribute] << ("Not a clickbait title")
    end
  end
end


class Post < ActiveRecord::Base
  validates :title, presence: true, clickbait: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  
end
