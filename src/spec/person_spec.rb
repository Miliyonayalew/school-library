require_relative './spec_helper'

describe Person do
  person = Person.new(25, name: 'gustavo')
  cap_decorator = CapitalizeDecorator.new(person)

  it 'should be an instance of Person' do
    expect(person).to be_an_instance_of(Person)
  end

  it 'should have a name' do
    expect(person.name).to eq('gustavo')
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

  it 'should have a can_use_services? method' do
    expect(person).to respond_to(:can_use_services?)
  end

  it 'should return true if the person can use the services' do
    expect(person.can_use_services?).to be true
  end

  it 'should return true if the person of_age? is above 18' do
    expect(person.send(:of_age?)).to be true
  end

  it 'should return corrected name' do
    expect(cap_decorator.correct_name).to eq('Gustavo')
  end
end
