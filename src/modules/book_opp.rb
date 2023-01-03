require 'json'

module BookOpp
  def persist_book(title, author)
    new_book = { 'title' => title, 'author' => author }
    book_data = File.read('./src/modules/books.json')
    book_list = JSON.parse(book_data)
    book_list << new_book
    File.write('./src/modules/books.json', JSON.pretty_generate(book_list))
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
