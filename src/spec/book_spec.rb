require_relative './spec_helper'

describe Book do
  let(:book) { Book.new('The Hobbit', 'J.R.R. Tolkien') }

  it 'should be an instance of Book' do
    expect(book).to be_an_instance_of(Book)
  end

  it 'should have a title' do
    expect(book.title).to eq('The Hobbit')
  end

  it 'should have an author' do
    expect(book.author).to eq('J.R.R. Tolkien')
  end

  it 'should have rentals' do
    expect(book.rentals).to be_an_instance_of(Array)
  end

  it 'should have a method to add rentals' do
    expect(book).to respond_to(:add_rental)
  end
end
