require_relative '../Person/nameable'
require_relative '../Person/rental'
require_relative '../Person/person'

RSpec.describe Person do
  let(:age) { 20 }
  let(:name) { 'Jane Doe' }
  let(:person) { Person.new(age, name) }

  describe 'initailize' do
    it 'creates a new person object' do
      expect(person.age).to eq(age)
      expect(person.name).to eq(name)
      expect(person.rentals).to be_empty
    end
  end

  describe 'correct name' do
    it 'returns persons name' do
      expect(person.correct_name).to eq(name)
    end
  end
end
