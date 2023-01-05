require_relative './spec_helper'

describe TrimmerDecorator do
  person = Person.new(22, name: 'maximilianus')
  trimmer_decorator = TrimmerDecorator.new(person)

  it 'should trim the name up to 10 charachter' do
    expect(trimmer_decorator.correct_name).to eq('maximilian')
  end

  it 'should be an instance of timmer decorator object' do
    expect(trimmer_decorator).to be_an_instance_of(TrimmerDecorator)
  end
end
