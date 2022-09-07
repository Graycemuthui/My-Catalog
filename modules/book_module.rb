module BookModule
  def list_books
    puts 'Book list is empty!' if @books.empty?
    @books.each_with_index do |book, index|
      puts "#{index}) #{book.title} by #{book.author} #{book.publish_date} #{book.publisher} #{book.cover_state}"
    end
  end

  def add_book
    puts 'Enter the title of the book:'
    title = gets.chomp
    puts 'Enter the author of the book:'
    author = gets.chomp
    puts 'Enter the publisher of the book:'
    publisher = gets.chomp
    puts 'Enter the cover state of the book:'
    cover_state = gets.chomp
    puts 'Enter the publish date of the book:'
    publish_date = gets.chomp
    print 'Enter the book\'s label name (e.g. Gift, New, etc.): '
    label_title = gets.chomp.capitalize
    print 'Enter the book\'s color (e.g. Red, Blue, Green, etc.): '
    book_color = gets.chomp.capitalize
    book = Book.new(title, author, publisher, cover_state, publish_date)
    @books << book
    @labels.push(Label.new(label_title, book_color)) unless @labels.any? do |l|
                                                              l.title == label_title && l.color == book_color
                                                            end
    @labels.find { |l| l.title == label_title && l.color == book_color }.add_item(@books.last)
    puts 'Book created successfully!'
  end

  def save_books
    book_hash = []
    @books.each do |book|
      book_hash << {
        title: book.title,
        publisher: book.publisher,
        id: book.id,
        cover_state: book.cover_state,
        author: book.author,
        publish_date: book.publish_date
      }
    end
    File.open('./json/books.json', 'w') { |f| f.puts book_hash.to_json }
  end

  def load_books
    book_file = File.exist?('./json/books.json') ? File.read('./json/books.json') : '[]'
    book_h = JSON.parse(book_file)
    book_h.each do |book|
      book_new = Book.new(book['title'], book['author'], book['publisher'], book['cover_state'], book['publish_date'])
      @books << book_new
    end
  end
end
