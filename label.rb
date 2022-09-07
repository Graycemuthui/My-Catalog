require 'securerandom'
class Label
  attr_accessor :title, :color, :items

  def initialize(title, color)
    @id = Random.rand(1...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.add_label(self)
  end
  # def to_json(*_args)
  #   {
  #     id: @id,
  #     title: @title,
  #     color: @color
  #   }.to_json
  # end

  # def to_s
  #   "Label: title = #{@title}, color = #{@color}"
  # end
end
