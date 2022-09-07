require_relative 'item'

class Book < Item

  attr_accessor :title,:author, :publisher, :cover_state, :publish_date

  def initialize(title,author,publisher, cover_state, publish_date,id: SecureRandom.uuid)
    super(publish_date)
    @id = id
    @cover_state = cover_state
    @publisher = publisher
    @title = title
    @author = author
  end
  # def to_json(*_args)
  #   {
  #     id: @id,
  #     title: @title,
  #     publish_date: @publish_date,
  #     archived: @archived,
  #     publisher: @publisher,
  #     cover_state: @cover_state,
  #     label_id: @label&.id
  #   }.to_json
  # end
  # def to_s
  #   "Book: title = #{@title}, publisher = #{@publisher}, " \
  #     "cover_state = #{@cover_state}, publish_date = #{@publish_date}, " \
  #     "archived = #{@archived}, label_title = #{@label&.title}, " \
  #     "label_color = #{@label&.color}"
  # end

  def can_be_archived?
    super || cover_state == 'bad'
  end
end