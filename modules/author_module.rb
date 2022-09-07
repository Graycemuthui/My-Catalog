module Authors
  @authors = []
  def list_authors
    @authors = add_authors
    puts 'Author list is empty! Add a author.' if @authors.empty?
    @authors.each_with_index do |author, index|
      p "#{index}) #{author.first_name} #{author.last_name}"
    end
  end

  def add_authors()
    init = []
    author_names = ['Stephen King', 'Charles Dickens', 'James Fenimore Cooper']
    author_names.each do |author|
      first_name = author.split[0]
      last_name = author.split[1]
      init << Author.new(first_name, last_name)
    end
    init
  end

  def save_authors
    author_hash = []
    return if @authors.nil?

    @authors.each do |author|
      author_hash << { first_name: author.first_name, last_name: author.last_name, id: author.id, items: author.items }
      File.open('authors.json', 'w') { |f| f.puts author_hash.to_json }
    end
  end

  def load_authors
    author_file = File.exist?('./authors.json') ? File.read('./authors.json') : '[]'
    author_h = JSON.parse(author_file)
    author_h.each do |author|
      @authors << Author.new(author['first_name'], author['last_name'])
    end
  end
end
