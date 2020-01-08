require 'rspec'
require 'pg'
require 'book'
# require 'song'
require 'pry'
require 'patron'

DB = PG.connect({:dbname => 'nova_library_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM books *;")
    # DB.exec("DELETE FROM songs *;")
    DB.exec("DELETE FROM patrons *;")
  end
end
