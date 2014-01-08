# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Events seed with json
puts 'Seeding Events...'
Event.delete_all
json = JSON.load File.open('db/events.json')
json.each do |item|
	Event.create! item
end


#User seed with json
puts 'Seeding Users...'
User.delete_all
json = JSON.load File.open('db/users.json')
json.each do |item|
	User.create! item
end


#Ticket seed with json
puts 'Seeding Tickets...'
Ticket.delete_all
json = JSON.load File.open('db/tickets.json')
json.each do |item|
	Ticket.create! item
end