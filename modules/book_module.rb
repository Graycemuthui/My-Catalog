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
        @labels.push(Label.new(label_title, book_color)) unless @labels.any? { |l| l.title == label_title && l.color ==book_color }
        @labels.find { |l| l.title == label_title && l.color == book_color }.add_item(@books.last)
        puts 'Book created successfully!'
    end

        
end