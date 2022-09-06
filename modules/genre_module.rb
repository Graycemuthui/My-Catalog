module Genres
  def list_genres
    genres = add_genres
    puts 'Genre list is empty! Add a genre.' if genres.empty?
    genres.each_with_index do |genre, index|
      p "#{index}) #{genre.names}"
    end
  end

  def add_genres()
    init = []
    genre_names = %w[Comedy Thriler]
    genre_names.each do |genre|
      genres_names = genre.split[0]
      init << Genre.new(genre_names)
    end
    init
  end
end
