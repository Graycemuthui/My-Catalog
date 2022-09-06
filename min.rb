require_relative 'data_storage'
class Main
  def initialize
    @app = App.new
    @option = [
      '1 : List all movies ',
      '2 : List all sources ',
      '3 : Add a movie',
      '4 : Exit'
    ]
    @exit = false
  end

  def user_interface
    until @exit
      @option.each do |opt|
        puts opt
      end
      choice = gets.chomp.to_i
      get_choice(choice)
    end
  end

  def get_choice(choice)
    case choice
    when 1
      @app.list_movie
    when 2
      @app.list_sources
    when 3
      @app.add_movie
    when 4
      @exit = true
    else
      puts 'wrong choice !'
    end
  end
end

main = Main.new
main.user_interface
