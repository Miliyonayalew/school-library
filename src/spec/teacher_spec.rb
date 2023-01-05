require_relative './spec_helper'

describe Teacher do
  teacher = Teacher.new('Math', 25, name: 'Gustavo')

  it 'should be an instance of Teacher' do
    expect(teacher).to be_an_instance_of(Teacher)
  end

  it 'should have a name equals to Gustavo' do
    expect(teacher.name).to eq('Gustavo')
  end

  it 'should have an age equals to 25' do
    expect(teacher.age).to eq(25)
  end

  it 'should return true if the teacher can use the services' do
    expect(teacher.can_use_services?).to be true
  end

  it 'should have a specialization in Math' do
    expect(teacher.specialization).to eq('Math')
  end
end
