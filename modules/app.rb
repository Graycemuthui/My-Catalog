require_relative './options'
require_relative './author_module'
require_relative './games_module'
require_relative '../game'
require_relative '../author'
require_relative './book_module'
require_relative '../book'
require_relative './labels_module'
require_relative '../label'

class Catalog
  include Options
  include Authors
  include Games
  include BookModule
  include LabelModule
  attr_reader :books, :music_albums, :movies, :games

  def initialize
    @books = []
    @music_albums = []
    @movies = []
    @games = []
    @labels = []
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
      # puts "\nList @books"
      list_books

    when 2
      puts "\nList @music_albums"
    when 3
      puts "\nList @movies"
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
      read_labels
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
      # puts "\nAdd @Book"
      add_book
    when 10
      puts "\nAdd @music album"
    when 11
      puts "\nAdd @movie"
    when 12
      add_game
    else
      puts 'You put the wrong input. Please enter a number between 1 and 13.'
    end
  end
end
