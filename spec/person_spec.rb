require_relative '../person'

describe Person do
  let(:person) { Person.new }

  it 'should initialize person class with all attributes' do
    person = Person.new(21, 'muneeb')
    expect(person).to have_attributes(name: 'muneeb', id: kind_of(Integer), age: 21, rentals: [])
  end

  context 'when the person is of age' do
    it 'returns true' do
      person.age = 20
      expect(person.can_use_services?).to be true
    end
  end

  context 'when the person is not of age but has parent permission' do
    it 'returns true' do
      person.age = 15
      expect(person.can_use_services?).to be true
    end
  end

  context 'when the person is not of age and does not have parent permission' do
    it 'returns false' do
      person.age = 15
      person.parent_permission = false
      expect(person.can_use_services?).to be false
    end
  end

  it 'should store data in rentals array and pass itself to add_person method' do
    rental = double('rental')
    allow(rental).to receive(:add_person)
    person.add_rental(rental)

    expect(person.rentals).to include(rental)
    expect(rental).to have_received(:add_person).with(person)
  end
end
