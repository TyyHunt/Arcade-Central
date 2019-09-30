# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first


100.times do 
    Player.create(
        username: Faker::Name.unique.name,
        age: Faker::Number.number(digits: 2),
        allowance: 5.00,
        password: 'password'
        )
end

10.times do 
    Arcade.create(
        name: Faker::Company.unique.name,
        location: Faker::Address.unique.city,
        open_time: Faker::Number.number(digits: 1),
        close_time: Faker::Number.number(digits: 1),
        est_year: 1999,
        owner_name: Faker::Name.unique.name
        )
end

100.times do 
    Game.create(
        name: Faker::Superhero.name,
        num_players: Faker::Number.between(from: 1,to: 6),
        cost: 0.25,
        working: Faker::Boolean.boolean,
        arcade_id: Faker::Number.number(digits: 1),
        player_id: Faker::Number.number(digits: 2)
        )
end
