# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..5).each do |i|
  User.create(:name => "user_#{i}", :email => "user_#{i}@email.com.br", :password => '12345678')
end


(1..5).each do |i|
  Election.create name: "sugestao_#{i}", text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum quae, maiores aperiam tempore consectetur incidunt quidem voluptates, impedit quo placeat ex quam inventore non a ea dolorem laudantium qui, delectus!', user_id: rand(1..5)
end