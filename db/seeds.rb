# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create( email: 'rublyanukr2008@gmail.com', password: '123456', password_confirmation: '123456')
User.create( email: 'rublyanukr@gmail.com', password: '123456', password_confirmation: '123456')
User.create( email: 'pierre@michaux.com', password: 'progenitor', password_confirmation: 'progenitor')

Category.create(title: 'road bike')
Category.create(title: 'Mountain bike')
Category.create(title: 'bmx bike')
Category.create(title: 'hiway bike')

100.times do
  Bicycle.create(name: Faker::Pokemon.name, description: Faker::Lorem.paragraph, category: Category.all.sample,
                 user: User.first)
end
