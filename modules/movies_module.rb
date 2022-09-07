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
end