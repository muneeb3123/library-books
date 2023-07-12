require_relative '../student'

describe Student do
  let(:classroom) { Classroom.new('Math') }
  let(:student) { Student.new }

  it 'should initialize all attributes' do
    student = Student.new('muneeb', 21, parent_permission: false)
    expect(student).to have_attributes(name: 'muneeb', age: 21, parent_permission: false)
  end

  it 'should be child of parent and initialize it' do
    student = Student.new('muneeb', 21, parent_permission: false)
    expect(student).to be_a(Person)
  end

  it 'assigns the classroom' do
    student.add_classroom(classroom)
    expect(student.classroom).to eq(classroom)
  end

  it 'adds the student to the classroom' do
    student.add_classroom(classroom)
    expect(classroom.students).to include(student)
  end

  it 'does not add the student to the classroom if already present' do
    classroom.add_student(student)
    expect { student.add_classroom(classroom) }.not_to(change { classroom.students.count })
  end
end
