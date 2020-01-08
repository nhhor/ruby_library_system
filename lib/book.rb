class Book
  attr_accessor :name, :id


  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_books = DB.exec("SELECT * FROM books;")
    books = []
    returned_books.each() do |book|
      name = book.fetch("name")
      id = book.fetch("id").to_i
      books.push(Book.new({:name => name, :id => id}))
    end
    books.sort_by { |book| [book.name] }
  end

  def self.search(query)
    returned_books = DB.exec("SELECT * FROM books WHERE name LIKE '%#{query}%';")
    books = []
    returned_books.each() do |book|
      name = book.fetch("name")
      id = book.fetch("id").to_i
      books.push(Book.new({:name => name, :id => id}))
    end
    books.sort_by { |book| [book.name] }
  end



  def save
    result = DB.exec("INSERT INTO books (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(book_to_compare)
    if book_to_compare != nil
      self.name() == book_to_compare.name()
    else
      false
    end
  end

  def self.clear
    DB.exec("DELETE FROM books *;")
  end

  def self.find(id)
    book = DB.exec("SELECT * FROM books WHERE id = #{id};").first
    if book
      name = book.fetch("name")
      id = book.fetch("id").to_i
      Book.new({:name => name, :id => id})
    else
      nil
    end
  end

  def update(name)
    @name = name
    DB.exec("UPDATE books SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM books WHERE id = #{@id};")
    # DB.exec("DELETE FROM songs WHERE book_id = #{@id};")
  end

  # def songs
  #   Song.find_by_book(self.id)
  # end
end
