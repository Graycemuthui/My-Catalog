require 'date'
require_relative '../source'
require_relative '../movie'

describe Source do
  before :all do
    @movie = Movie.new('twilight', '2019-07-09', true)
    @source = Source.new('a friend')
  end

  context 'When creating @source. an instance of class source' do
    it 'should take parameters and return source object' do
      @source.should be_an_instance_of Source
    end
  end

  context 'When retrieving the name of a source' do
    it 'should return the source name' do
      expect(@source.name).to eq('a friend')
    end
  end

  context 'When adding a movie into a source' do
    it 'should add the movie to the source' do
      expect(@source.add_item(@movie)).to include(@movie)
    end
  end
end
