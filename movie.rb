class Movie < Item
  attr_accessor :id, :name, :publish_date, :silet

  def initialize(name, publish_date, silet)
    super(publish_date)
    @id = Random.rand(1...1000)
    @name = name
    @silet = silet
  end

  def can_be_archived?
    super && @silet == true
  end
end
