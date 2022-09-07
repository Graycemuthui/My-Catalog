module Properties
  def define_author
    print 'Author first name:'
    first_name = gets.chomp
    print 'Author last name:'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors << author
    author
  end

  def define_label
    print 'Label title:'
    label_title = gets.chomp
    print 'Label color:'
    label_color = gets.chomp
    label = Label.new(label_title, label_color)
    @labels << label
    label
  end

  def define_genre
    print 'Genre:'
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    @genres << genre
    genre
  end

  def define_source
    print 'Source name:'
    name = gets.chomp
    source = Source.new(name)
    @sources << source
    source
  end
end
