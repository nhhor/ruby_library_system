require 'spec_helper'

describe '#Patron' do

  describe('.all') do
    it("returns an empty array when there are no books") do
      expect(Patron.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an patron") do
      patron = Patron.new({:name => "A Love Supreme", :id => nil})
      patron.save()
      patron2 = Patron.new({:name => "Blue", :id => nil})
      patron2.save()
      expect(Patron.all).to(eq([patron, patron2]))
    end
  end

  describe('.clear') do
    it("clears all patrons") do
      patron = Patron.new({:name => "A Love Supreme", :id => nil})
      patron.save()
      patron2 = Patron.new({:name => "Blue", :id => nil})
      patron2.save()
      Patron.clear
      expect(Patron.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same patron if it has the same attributes as another patron") do
      patron = Patron.new({:name => "Blue", :id => nil})
      patron2 = Patron.new({:name => "Blue", :id => nil})
      expect(patron).to(eq(patron2))
    end
  end

  describe('.find') do
    it("finds an patron by id") do
      patron = Patron.new({:name => "A Love Supreme", :id => nil})
      patron.save()
      patron2 = Patron.new({:name => "Blue", :id => nil})
      patron2.save()
      expect(Patron.find(patron.id)).to(eq(patron))
    end
  end

  describe('#update') do
    it("adds an book to an patron") do
      patron = Patron.new({:name => "John Coltrane", :id => nil})
      patron.save()

      patron2 = Patron.new({:name => "ARTIST TO DELETE", :id => nil})
      patron2.save()
      book2 = Book.new({:name => "ALBUM TO DELETE", :id => nil})
      book2.save()


      book = Book.new({:name => "A Love Supreme", :id => nil})
      book.save()

      patron3 = Patron.new({:name => "ARTIST TO DELETE2", :id => nil})
      patron.save()
      book3 = Book.new({:name => "ALBUM TO DELETE2", :id => nil})
      book3.save()

      patron.update({:book_name => "A Love Supreme"})

      patron.update({:book_name => "ALBUM TO DELETE2"})
      puts patron.books
      expect(patron.books).to(eq([book, book3]))
    end
  end

  describe('#delete') do
    it("deletes an patron by id") do
      patron = Patron.new({:name => "A Love Supreme", :id => nil})
      patron.save()
      patron2 = Patron.new({:name => "Blue", :id => nil})
      patron2.save()
      patron.delete()
      expect(Patron.all).to(eq([patron2]))
    end
  end

  # describe('#patrons') do
  #   it("returns an patron's songs") do
  #     patron = Patron.new({:name => "John Coltrane", :patron_id => nil})
  #     patron.save()
  #     song = Song.new({:name => "Naima", :patron_id => patron.id, :id => nil})
  #     song.save()
  #     song2 = Song.new({:name => "Cousin Mary", :patron_id => patron.id, :id => nil})
  #     song2.save()
  #     expect(Patron.songs).to(eq([song, song2]))
  #   end
  # end
end
