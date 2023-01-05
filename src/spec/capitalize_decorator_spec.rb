require_relative './spec_helper'

describe CapitalizeDecorator do
  person = Person.new(22, name: 'maximilianus')
  capitalized_decorator = CapitalizeDecorator.new(person)

  it 'should capitalize the name to Maximilianus' do
    expect(capitalized_decorator.correct_name).to eq('Maximilianus')
  end

  it 'should be an instance of capitalize decorator object' do
    expect(capitalized_decorator).to be_an_instance_of(CapitalizeDecorator)
  end
end
