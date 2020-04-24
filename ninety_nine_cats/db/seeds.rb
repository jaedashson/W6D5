# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

cat1 = Cat.create!(name: "Meowseph Stalin", birth_date: "1878/12/18", color: "black", sex: "M", description: "Glory to the Meowletariat")

cat2 = Cat.create!(name: "Benny the Ball", birth_date: "1962/9/27", color: 'white', sex: 'M', description: "Top cats weed carrier")

cat3 = Cat.create!(name: "Cat Stevens", birth_date: "2000/1/1", color: "sepia", sex: "F", description: "Meeeeoooww")

cat2 = Cat.create!(name: "Mewtwo", birth_date: "3000/2/6", color: 'white', sex: 'M', description: "Obviously a ringer...")
