require_relative './spec_helper'

describe Person do
  let(:person) { Person.new(25, name: 'Gustavo') }

  it 'should be an instance of Person' do
    expect(person).to be_an_instance_of(Person)
  end

  it 'should have a name' do
    expect(person.name).to eq('Gustavo')
  end

  it 'should have an age' do
    expect(person.age).to eq(25)
  end

  it 'should have rentals' do
    expect(person.rentals).to be_an_instance_of(Array)
  end

  it 'should have a method to add rentals' do
    expect(person).to respond_to(:add_rental)
  end
end
