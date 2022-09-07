module Games
  def list_games
    puts 'Games list is empty! Add a game.' if @games.empty?
    @games.each_with_index do |game, index|
      s = "Last played at: #{game.last_played_at} - published: #{game.publish_date}"
      p "#{index}) Mulitiplayer: #{game.mulitiplayer} - " + s
    end
  end

  def add_game
    print 'Mulitiplayer: '
    mplayer = gets.chomp
    print 'Last played at: '
    last_played_at = gets.chomp
    print 'Published: '
    published = gets.chomp
    game = Game.new(mplayer, last_played_at, published)
    @games << game
    puts "Game #{mplayer} created successfully."
  end

  def save_games
    game_hash = []
    @games.each do |game|
      game_hash << {
        mulitiplayer: game.mulitiplayer,
        last_played_at: game.last_played_at,
        id: game.id,
        publish_date: game.publish_date
      }
      File.open('games.json', 'w') { |f| f.puts game_hash.to_json }
    end
  end

  def load_game
    game_file = File.exist?('./games.json') ? File.read('./games.json') : '[]'
    game_h = JSON.parse(game_file)
    game_h.each do |game|
      @games << Game.new(game['mulitiplayer'], game['last_played_at'], game['publish_date'])
    end
  end
end
