require_relative '../teacher'

describe Teacher do
  let(:teacher) { Teacher.new('Computer Science', 'Javed Shbaz', 31) }
  it 'should initialize all attributes' do
    expect(teacher.name).to eql('Javed Shbaz')
    expect(teacher.specialization).to eql('Computer Science')
    expect(teacher.age).to eql(31)
  end

  it 'should inherit from the Person class' do
    expect(teacher).to be_a(Person)
  end

  it 'should be true' do
    expect(teacher.can_use_services?).to eql(true)
  end
end
