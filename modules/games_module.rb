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

    p 'Add author for this game:'
    game.add_author(define_author)

    p 'Add label for this game:'
    game.add_label(define_label)

    game.add_genre(define_genre)

    game.move_to_archive
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
        publish_date: game.publish_date,
        author_first_name: game.author.first_name,
        author_last_name: game.author.last_name
      }
      File.open('./json/games.json', 'w') { |f| f.puts game_hash.to_json }
    end
  end

  def load_game
    game_file = File.exist?('./json/games.json') ? File.read('./json/games.json') : '[]'
    game_h = JSON.parse(game_file)
    game_h.each do |game|
      game_new = Game.new(game['mulitiplayer'], game['last_played_at'], game['publish_date'])
      author = Author.new(game['author_first_name'], game['author_last_name'])
      game_new.add_author(author)
      @games << game_new
    end
  end
end
