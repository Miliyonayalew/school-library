require_relative './spec_helper'

describe Rental do
  let(:rental) { Rental.new('2023-01-04', 'Mila', 'The Little Prince') }

  it 'Should be a instance of Rental' do
    expect(rental).to be_an_instance_of(Rental)
  end

  it 'Should have a date' do
    expect(rental.date).to eq('2023-01-04')
  end

  it 'Should have a person' do
    expect(rental.person).to eq('Mila')
  end

  it 'Should have a book' do
    expect(rental.book).to eq('The Little Prince')
  end
end
