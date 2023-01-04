require 'json'

module BookOpp
  def persist_book(title, author)
    new_book = { 'title' => title, 'author' => author }
    book_data = File.read('books.json')
    @books = JSON.parse(book_data)
    @books << new_book
    File.write('books.json', JSON.pretty_generate(@books))
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book unless @books.include?(book)
    persist_book(title, author)

    puts "\n Book is successfully created 📚"
  end
end
