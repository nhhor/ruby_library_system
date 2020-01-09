require 'spec_helper'

describe '#Author' do

  describe('.all') do
    it("returns an empty array when there are no books") do
      expect(Author.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an author") do
      author = Author.new({:name => "A Love Supreme", :id => nil})
      author.save()
      author2 = Author.new({:name => "Blue", :id => nil})
      author2.save()
      expect(Author.all).to(eq([author, author2]))
    end
  end

  describe('.clear') do
    it("clears all authors") do
      author = Author.new({:name => "A Love Supreme", :id => nil})
      author.save()
      author2 = Author.new({:name => "Blue", :id => nil})
      author2.save()
      Author.clear
      expect(Author.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same author if it has the same attributes as another author") do
      author = Author.new({:name => "Blue", :id => nil})
      author2 = Author.new({:name => "Blue", :id => nil})
      expect(author).to(eq(author2))
    end
  end

  describe('.find') do
    it("finds an author by id") do
      author = Author.new({:name => "A Love Supreme", :id => nil})
      author.save()
      author2 = Author.new({:name => "Blue", :id => nil})
      author2.save()
      expect(Author.find(author.id)).to(eq(author))
    end
  end

  describe('#update') do
    it("adds an book to an author") do
      author = Author.new({:name => "John Coltrane", :id => nil})
      author.save()

      author2 = Author.new({:name => "ARTIST TO DELETE", :id => nil})
      author2.save()
      book2 = Book.new({:name => "ALBUM TO DELETE", :id => nil})
      book2.save()


      book = Book.new({:name => "A Love Supreme", :id => nil})
      book.save()

      author3 = Author.new({:name => "ARTIST TO DELETE2", :id => nil})
      author.save()
      book3 = Book.new({:name => "ALBUM TO DELETE2", :id => nil})
      book3.save()

      author.update({:book_name => "A Love Supreme"})

      author.update({:book_name => "ALBUM TO DELETE2"})
      puts author.books
      expect(author.books).to(eq([book, book3]))
    end
  end

  describe('#delete') do
    it("deletes an author by id") do
      author = Author.new({:name => "A Love Supreme", :id => nil})
      author.save()
      author2 = Author.new({:name => "Blue", :id => nil})
      author2.save()
      author.delete()
      expect(Author.all).to(eq([author2]))
    end
  end

  # describe('#authors') do
  #   it("returns an author's songs") do
  #     author = Author.new({:name => "John Coltrane", :author_id => nil})
  #     author.save()
  #     song = Song.new({:name => "Naima", :author_id => author.id, :id => nil})
  #     song.save()
  #     song2 = Song.new({:name => "Cousin Mary", :author_id => author.id, :id => nil})
  #     song2.save()
  #     expect(Author.songs).to(eq([song, song2]))
  #   end
  # end
end
