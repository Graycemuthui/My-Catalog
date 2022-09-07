module Movies
  def add_movie
    print 'Movie name: '
    name = gets.chomp
    print 'Source: '
    s_name = gets.chomp
    print 'Published date: '
    publish_date = gets.chomp
    print 'Movie is silent? [Y/N]'
    silent = gets.chomp.upcase
    case silent
    when 'Y'
      silent = true
    when 'N'
      silent = false
    else
      puts 'Invalid option \n'
    end

    source = Source.new(s_name)
    @sources.push(source)

    @movies << Movie.new(name, publish_date, silent)
    puts 'Movie Added successfully'
  end

  def list_movie
    puts 'List of all movie:'
    puts 'No movie recorded yet.' if @movies.empty?
    @movies.each do |movie|
      puts "movie name: #{movie.name},\nPublished date: #{movie.publish_date},\nsilent #{movie.silent}\n\n"
    end
  end

  def load_movies
    data = []
    file = './json/movies.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |movie|
        data.push(Movie.new(movie['name'], movie['publish_date'], movie['silent']))
      end
    else
      File.write(file, [])
    end
    data
  end

  def save_movies
    movies_hash = []
    @movies.each do |mov|
      movies_hash << {
        name: mov.name,
        publish_date: mov.publish_date,
        silent: mov.silent
      }
      File.open('./json/movies.json', 'w') { |f| f.puts movies_hash.to_json }
    end
  end
end
