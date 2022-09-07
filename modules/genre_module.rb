module Genres
  def list_genres
    puts ''
    puts 'List all genres:'
    puts ''
    if @genres.empty?
      puts 'No genres recorded yet.'
      return
    end
    @genres.each do |genre|
      puts "Genre: #{genre.names}"
    end
    puts ''
  end
end
