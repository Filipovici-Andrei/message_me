# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: 'Jim', password: 'password')
User.create(username: 'Helen', password: 'password')
User.create(username: 'Bod', password: 'password')
User.create(username: 'Mike', password: 'password')
Message.create(body: 'Message content 1', user: User.find(2))
Message.create(body: 'Message content 2', user: User.find(3))
