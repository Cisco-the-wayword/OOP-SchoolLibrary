require_relative '../Person/person'
require_relative '../Person/rental'
require_relative '../Book/book'
require_relative '../Classroom/classroom'

RSpec.describe Person do
  let(:age) { 20 }
  let(:name) { 'Jane Doe' }
  let(:parent_permission) { true }
  let(:person) { Person.new(age, name, parent_permission) }

  describe 'initialize' do
    it 'creates a new person object' do
      expect(person.age).to eq(age)
      expect(person.name).to eq(name)
      expect(person.rentals).to be_empty
    end
  end

  describe 'correct_name' do
    it 'returns person\'s name' do
      expect(person.correct_name).to eq(name)
    end
  end

  describe 'can_use_services?' do
    context 'when person is of age' do
      it 'returns true' do
        expect(person.can_use_services?).to be_truthy
      end
    end

    context 'when person is not of age' do
      let(:age) { 15 }

      it 'returns false' do
        expect(person.can_use_services?).to be_falsey
      end
    end

    context 'when person is not of age but has parent permission' do
      let(:age) { 15 }
      let(:parent_permission) { true }

      it 'returns true' do
        expect(person.can_use_services?).to be_truthy
      end
    end
  end

  describe 'of_age?' do
    context 'when person is of age' do
      it 'returns true' do
        expect(person.send(:of_age?)).to be_truthy
      end
    end

    context 'when person is not of age' do
      let(:age) { 15 }

      it 'returns false' do
        expect(person.send(:of_age?)).to be_falsey
      end
    end
  end

  describe 'add_rental' do
    let(:rental) { Rental.new(Date.today, Book.new('The Art of War', 'Sun Tzu'), person) }

    it 'adds the rental to person\'s rentals list' do
      expect { person.send(:add_rental, rental) }.to change { person.rentals.count }.by(1)
    end

    it 'sets the person attribute of the rental to the current person' do
      person.send(:add_rental, rental)
      expect(rental.person).to eq(person)
    end
  end
end
