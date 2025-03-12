class Cafe < ApplicationRecord



  # cafe.rb
validates :title, presence: true, uniqueness: { scope: :address } #the name AND adress COMBINE has to be unique (you can have starbuks in meguro and starbuks in shibuya but not 2 starbuks in meguro)
validates :address, presence: true
end
