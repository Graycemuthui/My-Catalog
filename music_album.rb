require './item'

class Music_Album
  attr_reader :on_spotify, :archived

  def initialize(_on_spotify, _archived)
    @on_spotify = false
    @archived = false
  end
end
