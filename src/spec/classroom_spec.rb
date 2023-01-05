require_relative './spec_helper'

describe Classroom do
  classroom = Classroom.new('C1')

  it 'Should be a instance of Classroom' do
    expect(classroom).to be_an_instance_of(Classroom)
  end

  it 'Should have a label equal to C1' do
    expect(classroom.label).to eq('C1')
  end

  it 'Should have students instance' do
    expect(classroom.students).to be_an_instance_of(Array)
  end

  it 'Should have a method to add students' do
    expect(classroom).to respond_to(:add_students)
  end
end
