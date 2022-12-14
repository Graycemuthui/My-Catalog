require_relative 'item'

class Book < Item
  attr_accessor :title, :author, :publisher, :cover_state, :publish_date

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @cover_state = cover_state
    @publisher = publisher
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end
end
