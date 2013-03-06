# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username:'jane',email:'jane@manager.com',password:'jane',password_confirmation:'jane')
Role.create(name:"Manager")
Role.create(name:"Renter")

user1 = User.find(1)
user1.roles << Role.where("name='Manager'")


