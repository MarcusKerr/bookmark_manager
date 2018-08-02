require './models/bookmark'

describe Bookmark do
  describe '#all' do
    it 'shows all bookmarks in an array' do
      insert_test_bookmarks
      expected_bookmarks = [
        'http://makersacademy.com',
        'http://destroyallsoftware.com',
        'http://google.com'
      ]
      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

  describe '#add' do
    it ' Adds a bookmark to the database' do
      Bookmark.add('http://Marekisthebest.com')
      expect(Bookmark.all).to include('http://Marekisthebest.com')
    end
  end 
end