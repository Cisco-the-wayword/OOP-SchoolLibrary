require_relative '../Book/classroom'
require_relative '../Person/student'

RSpec.describe Classroom do
  let(:label) { 'Physics' }
  let(:classroom) { Classroom.new(label) }
  let(:student) { Student.new(18, classroom) }

  describe '#initialize' do
    it 'creates a new Classroom object with the given label' do
      expect(classroom.label).to eq(label)
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
