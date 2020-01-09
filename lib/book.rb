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

  def self.available_books
    unavailable_books = DB.exec("SELECT book_id FROM books_patrons")
    unavailable_books_id_array = []
    unavailable_books.each() do |result|
      unavailable_books_id_array.push(result.values)
    end
    available_books = []
    if unavailable_books_id_array != []
      query_of_ids =  DB.exec("SELECT * FROM books WHERE id NOT IN (#{unavailable_books_id_array.join(", ")}) ORDER BY name;")
      query_of_ids.each() do |query|
        book_id = query.fetch("id").to_i()
        name = query.fetch("name")
        available_books.push(Book.new({:name => name, :id => book_id}))
      end
      available_books
    else
      query_of_ids =  DB.exec("SELECT * FROM books ORDER BY name;")
      query_of_ids.each() do |query|
        book_id = query.fetch("id").to_i()
        name = query.fetch("name")
        available_books.push(Book.new({:name => name, :id => book_id}))
      end
      available_books
    end
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

  def authors
    var = DB.exec("SELECT * FROM books_authors WHERE book_id = #{@id};")
    var.map do |element|
      Author.find(element.fetch('author_id'))
    end
  end


  # def authors
  #   books = []
  #   results = DB.exec("SELECT * FROM books_authors WHERE book_id = #{@id};")
  #   result_id_array = []
  #   results.each() do |result|
  #     result_id_array.push(result.values)
  #   end
  #   if result_id_array != []
  #     query_of_ids =  DB.exec("SELECT * FROM books WHERE id IN (#{result_id_array.join(", ")});")
  #     query_of_ids.each() do |query|
  #       book_id = query.fetch("id").to_i()
  #       name = query.fetch("name")
  #       books.push(Book.new({:name => name, :id => book_id}))
  #     end
  #     books
  #   else
  #     puts "NOVA error in patron.books"
  #     NIL
  #   end
  # end



end
