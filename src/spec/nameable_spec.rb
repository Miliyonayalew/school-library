require_relative './spec_helper'

describe Nameable do
  nameable = Nameable.new

  describe '#initialize' do
    it 'Should return the nameale object' do
      expect(nameable).to be_an_instance_of(Nameable)
    end
  end

  describe '#correct_name' do
    it 'Should have a method to correct the name' do
      expect(nameable).to respond_to(:correct_name)
    end
  end

  describe '#correct_name' do
    it 'Should raise a NotImplementedError' do
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
