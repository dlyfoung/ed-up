# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# TEST Dataset - to remove later on
for i in 1..3 
	Resource.create({name:"my book #{i}",author:"author #{i}",ref:"N/A",category:"paper book",rating:nil,progress:0})
end
