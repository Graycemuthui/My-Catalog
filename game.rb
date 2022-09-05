require './item'

class Game < Item
  attr_accessor :mulitiplayer, :last_played_at

  def initialize(mulitiplayer, last_played_at, *args)
    @mulitiplayer = mulitiplayer
    @last_played_at = last_played_at
    super(*args)
  end

  def can_be_archived?
    super && (Time.now.year - Date.parse(@last_played_at).year) > 2
  end
end

# game1 = Game.new(2, '2/2/2021', '2/2/2015')
# p game1.can_be_archived?