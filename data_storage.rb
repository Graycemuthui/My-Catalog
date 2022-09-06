require_relative 'movie'
require_relative 'source'
require 'date'
require 'json'

class App
  def initialize
    @movies = []
    @sources = []
  end

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

    puts 'Music Added successfully'
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

  def list_sources
    puts ''
    puts 'List of all sources:'
    puts ''
    if @sources.empty?
      puts 'No sources recorded yet.'
      return
    end
    @sources.each do |source|
      puts "Source: #{source.name}"
    end
    puts ''
  end
end
