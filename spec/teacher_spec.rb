require_relative '../Person/person'
require_relative '../Person/teacher'

RSpec.describe Teacher do
  let(:age) { 23 }
  let(:specialization) { 'Teacher' }
  let(:name) { 'Jane Smith' }
  let(:teacher) { Teacher.new(age, specialization, name) }

  describe '#initailze' do
    it 'should create new teacher object' do
      expect(teacher.age).to eq(age)
      expect(teacher.specialization).to eq(specialization)
      expect(teacher.name).to eq(name)
      expect(teacher.rentals).to be_empty
    end
  end

  describe 'Use service' do
    it 'indicating that the teacher can use services' do
      expect(teacher.can_use_services?).to be true
    end
  end
end
