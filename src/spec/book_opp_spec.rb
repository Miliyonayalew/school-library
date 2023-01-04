require_relative './spec_helper'

describe BookOpp do
  include BookOpp

  describe '#create_book' do
    it 'creates a new book' do
      books = []
      book = Book.new('The Lord of the Rings', 'J.R.R. Tolkien')
      books << book
      expect(books).to include(book)
    end
  end

  describe '#list_books' do
    it 'lists all books' do
      books = []
      book = Book.new('The Lord of the Rings', 'J.R.R. Tolkien')
      books << book
      book = Book.new('The Hobbit', 'J.R.R. Tolkien')
      books << book
      expect(books.length).to eq(2)
    end
  end
end
