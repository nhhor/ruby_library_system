require('capybara/rspec')
require('./app')
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an book path', {:type => :feature}) do
  it('creates an book and then goes to the book page') do
    visit('/books')
    click_on('Add a new book')
    fill_in('book_name', :with => 'Yellow Submarine')
    click_on('Add book')
    expect(page).to have_content('Yellow Submarine')
  end
end

# describe('create a song path', {:type => :feature}) do
#   it('creates an book and then goes to the book page') do
#     book = Book.new({:name => "Yellow Submarine", :id => nil})
#     book.save
#     visit("/books/#{book.id}")
#     fill_in('song_name', :with => 'All You Need Is Love')
#     click_on('Add song')
#     expect(page).to have_content('All You Need Is Love')
#   end
# end
