require_relative '../movie'
describe Movie do
  before :each do
    @movie = Movie.new('twilight', '2019-07-09', true)
  end

  context 'When creating @movie. an instance of class movie' do
    it 'should take parameters and return source object' do
      @movie.should be_an_instance_of Movie
    end
  end

  context 'When retrieving the name of a movie' do
    it 'should return the correct movie name' do
      expect(@movie.name).to eq('twilight')
    end
  end

  context 'When checking the published date' do
    it 'it should return a published date' do
      expect(@movie.publish_date).to eq('2019-07-09')
    end
  end

  context '' do
    it 'should return true if parents method returns true OR if silent equals true' do
      expect(@movie.can_be_archived?).to eq(true)
    end
  end
end
