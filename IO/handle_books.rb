require 'json'
require_relative '../book'

module HandleBook
  def store_book
    books_arr = []
    @books.each do |book|
      books_arr << { title: book.title, author: book.author }
    end
    write_json(books_arr, 'books.json')
  end

  def load_books
    file = File.read('books.json')
    JSON
      .parse(file)
      .each { |book| @books.push(Book.new(book['title'], book['author'])) }
  end
end
