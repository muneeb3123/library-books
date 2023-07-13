require_relative '../classroom'

describe Classroom do
  let(:classroom) { Classroom.new('Math') }

  it 'initializes all attributes' do
    expect(classroom).to have_attributes(label: 'Math', students: [])
  end

  it 'should pass itself to the student class and store student data in the students array' do
    student = double('student')
    allow(student).to receive(:add_classroom)
    classroom.add_student(student)
    expect(classroom.students).to include(student)
    expect(student).to have_received(:add_classroom).with(classroom)
  end
end
