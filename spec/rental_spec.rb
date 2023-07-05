require_relative '../Person/rental'
require_relative '../Book/book'
require_relative '../Person/person'

RSpec.describe Rental do
  let(:date) { '2023-06-28' }
  let(:book) { Book.new('The Art of War', 'Sun Tzu') }
  let(:person) { Person.new(25, 'Jane Doe') }
  let(:rental) { Rental.new(date, book, person) }

  describe '#initialize' do
    it 'creates a new Rental object with the given date, book, and person' do
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end
end
