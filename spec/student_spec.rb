require_relative '../Person/person'
require_relative '../Person/student'

RSpec.describe Student do
  let(:age) { 13 }
  let(:classroom) { 'Maths' }
  let(:name) { 'Jane Doe' }
  let(:student) { Student.new(age, classroom, name) }

  describe 'initialize' do
    it 'should create new student object' do
      expect(student.age).to eq(age)
      expect(student.classroom).to eq(classroom)
      expect(student.name).to eq(name)
      expect(student.rentals).to be_empty
    end
  end

  describe 'play_hooky' do
    it 'student plays hooky' do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end

  describe 'classroom=' do
    let(:classroom) { Classroom.new('Maths') }

    it 'sets the classroom attribute of the student' do
      student.send(:classroom=, classroom)
      expect(student.classroom).to eq(classroom)
    end

    it 'adds the student to the classroom if not already included' do
      student.send(:classroom=, classroom)
      expect(classroom.students).to include(student)
    end

    it 'does not add the student to the classroom if already included' do
      classroom.students.push(student)
      expect { student.send(:classroom=, classroom) }.not_to(change { classroom.students.count })
    end
  end
end
