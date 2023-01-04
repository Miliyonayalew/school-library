require_relative './spec_helper'

describe Student do
  let(:student) { Student.new('C1', 25, name: 'Miliyon') }

  it 'should be an instance of Student' do
    expect(student).to be_an_instance_of(Student)
  end

  it 'should have a classroom' do
    expect(student.classroom).to eq('C1')
  end

  it 'should have a name' do
    expect(student.name).to eq('Miliyon')
  end

  it 'should have an age' do
    expect(student.age).to eq(25)
  end

  it 'should have rentals' do
    expect(student.rentals).to be_an_instance_of(Array)
  end

  it 'should have a method to play_hooky' do
    expect(student).to respond_to(:play_hooky)
  end
end
