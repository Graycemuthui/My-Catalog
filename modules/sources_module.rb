module Sources
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

  def load
    load_sources
  end

  def dump
    dump_sources
  end

  def dump_sources
    sources = @sources.map { |src| [src.name] }
    store = JSON.dump(sources)
    File.write('sources.json', store)
  end

  def load_sources
    return unless File.exist?('sources.json')

    sources = JSON.parse(File.read('sources.json'))
    sources.each do |source|
      obj = Source.new(*source[1..])
      obj.id = source.first
      @sources << obj
    end
  end
end
