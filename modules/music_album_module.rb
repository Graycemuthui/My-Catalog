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
    album = MusicAlbum.new(album_name, published, album_spotify)
    @music_albums << album
    puts "Music album #{album_name} created successfully."
  end
end
