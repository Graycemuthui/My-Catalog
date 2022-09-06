require_relative './options'
require_relative './author_module'
require_relative './games_module'
require_relative '../game'
require_relative '../author'
require_relative '../movie'
require_relative '../source'
require_relative './movies_module'
require_relative './sources_module'
require 'date'

class Catalog
  include Options
  include Authors
  include Games
  include Movies
  include Sources 
  attr_reader :books, :music_albums, :movies, :games, :sources

  def initialize
    @books = []
    @music_albums = []
    @movies = []
    @games = []
    @sources = []
  end

  def act_regarding_input
    loop do
      Options.options
      choice = gets.to_i
      if choice == 13
        puts 'Thank You for using this app!'
        break
      end
      operation1(choice)
    end
  end

  # call the methods you create for various classes
  def operation1(input)
    case input

    when 1
      puts "\nList @books"
    when 2
      puts "\nList @music_albums"
    when 3
      list_movie
    when 4
      list_games
    else
      operation2(input)
    end
  end

  def operation2(input)
    case input

    when 5
      list_genres
    when 6
      list_lables
    when 7
      list_authors
    when 8
      list_sources
    else
      operation3(input)
    end
  end

  def operation3(input)
    case input

    when 9
      puts "\nAdd @Book"
    when 10
      puts "\nAdd @music album"
    when 11
     add_movie
    when 12
      add_game
    else
      puts 'You put the wrong input. Please enter a number between 1 and 13.'
    end
  end
end
