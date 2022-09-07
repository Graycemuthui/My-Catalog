module MusicAlbums
  def list_music_albums
    puts 'Music albums list is empty! Add a music album.' if @music_albums.empty?
    music_albums.each_with_index do |music_album, index|
      s = "Last played at: #{music_album.name} - published: #{music_album.publish_date}"
      p ["#{index})  On Spotify: #{music_album.on_spotify} - " + s]
    end
  end

  def add_music_album
    print 'Name of the Album: '
    album_name = gets.chomp
    print 'Name of the genre: '
    g_name = gets.chomp
    print 'Published date: '
    published = gets.chomp
    print 'On Spotify? (y/n): '

    album_spotify = gets.chomp.upcase
    case album_spotify
    when 'Y'
      album_spotify = true
    when 'N'
      album_spotify = false
    else
      puts 'Invalid option. Please try again.'
    end

    genre = Genre.new(g_name)
    @genres.push(genre)

    album = MusicAlbum.new(album_name, published, album_spotify)
    @music_albums << album

    puts "Music album #{album_name} created successfully."
  end

  def save_album
    album = []
    @music_albums.each do |music_album|
      album << {
        name: music_album.name,
        publish_date: music_album.publish_date,
        on_spotify: music_album.on_spotify
      }
      File.open('./json/music_albums.json', 'w') { |f| f.puts album.to_json }
    end
  end

  def load_album
    album_file = File.exist?('./json/music_album.json') ? File.read('.json/music_albums.json') : '[]'
    album_h = JSON.parse(album_file)
    album_h.each do |album|
      @music_albums << MusicAlbum.new(album['name'], album['genre'], album['publish_date'], album['on_spotify'])
    end
  end
end
