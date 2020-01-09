class Author
  attr_accessor :name, :id


  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_authors = DB.exec("SELECT * FROM authors;")
    authors = []
    returned_authors.each() do |author|
      name = author.fetch("name")
      id = author.fetch("id").to_i
      authors.push(Author.new({:name => name, :id => id}))
    end
    authors.sort_by { |author| [author.name] }
  end

  def self.search(query)
    returned_authors = DB.exec("SELECT * FROM authors WHERE name LIKE '%#{query}%';")
    authors = []
    returned_authors.each() do |author|
      name = author.fetch("name")
      id = author.fetch("id").to_i
      authors.push(Author.new({:name => name, :id => id}))
    end
    authors.sort_by { |author| [author.name] }
  end



  def save
    result = DB.exec("INSERT INTO authors (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(author_to_compare)
    if author_to_compare != nil
      self.name() == author_to_compare.name()
    else
      false
    end
  end

  def self.clear
    DB.exec("DELETE FROM authors *;")
  end

  def self.find(id)
    author = DB.exec("SELECT * FROM authors WHERE id = #{id};").first
    if author
      name = author.fetch("name")
      id = author.fetch("id").to_i
      Author.new({:name => name, :id => id})
    else
      nil
    end
  end

  def update(attributes)
    if (attributes.is_a? String)
      @name = attributes
      DB.exec("UPDATE authors SET name = '#{@name}' WHERE id = #{@id};")
    else
      book_name = attributes.fetch(:book_name)
      if book_name != nil
        book = DB.exec("SELECT * FROM books WHERE lower(name)='#{book_name.downcase}';").first
        if book != nil
          DB.exec("INSERT INTO books_authors (book_id, author_id) VALUES (#{book['id'].to_i}, #{@id});")
        end
      end
    end
  end

  def delete
    DB.exec("DELETE FROM books_authors WHERE author_id = #{@id};")
    DB.exec("DELETE FROM authors WHERE id = #{@id};")
  end

  def return_book(book_id)
    DB.exec("DELETE FROM books_authors WHERE book_id = #{book_id} AND author_id = #{@id};")
  end

  def books
    books = []
    results = DB.exec("SELECT book_id FROM books_authors WHERE author_id = #{@id};")
    result_id_array = []
    results.each() do |result|
      result_id_array.push(result.values)
    end
    if result_id_array != []
      query_of_ids =  DB.exec("SELECT * FROM books WHERE id IN (#{result_id_array.join(", ")});")
      query_of_ids.each() do |query|
        book_id = query.fetch("id").to_i()
        name = query.fetch("name")
        books.push(Book.new({:name => name, :id => book_id}))
      end
      books
    else
      puts "NOVA error in author.books"
      NIL
    end
  end

end
