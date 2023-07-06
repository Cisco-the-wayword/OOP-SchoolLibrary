require_relative '../Person/rental'
require_relative '../Book/book'
require 'json'

RSpec.describe Book do
  let(:title) { 'The Art of War' }
  let(:author) { 'Sun Tzu' }
  let(:book) { Book.new(title, author) }

  describe 'initialize' do
    it 'creates a new Book object with the given title and author' do
      expect(book.title).to eq(title)
      expect(book.author).to eq(author)
      expect(book.rentals).to be_empty
    end
  end

  describe '#to_json' do
    it 'returns the book object in JSON format' do
      json_data = book.to_json
      parsed_data = JSON.parse(json_data)
      expect(parsed_data['title']).to eq(title)
      expect(parsed_data['author']).to eq(author)
    end
  end
end
