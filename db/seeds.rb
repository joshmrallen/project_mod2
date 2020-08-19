Quote.delete_all
Favorite.delete_all

20.times do
    Quote.create(author: Faker::Name.name, content: Faker::Quote.yoda)
end

