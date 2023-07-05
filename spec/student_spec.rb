require_relative '../Person/person'
require_relative '../Person/student'

RSpec.describe Student do
  let(:age) { 13 }
  let(:classroom) { 'Maths' }
  let(:name) { 'Jane Doe' }
  let(:student) { Student.new(age, classroom, name) }

  describe 'initailize' do
    it 'should create new student object' do
      expect(student.age).to eq(age)
      expect(student.classroom).to eq(classroom)
      expect(student.name).to eq(name)
      expect(student.rentals).to be_empty
    end
  end

  describe 'play hooky' do
    it 'student plays hooky' do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end
end
