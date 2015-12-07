# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: 'Patrick',
             email: 'pmo@gmail.com',
             password: 'foobarhash')

User.create!(name: 'Bob',
             email: 'bob@foobar.com',
             password: 'foobarhash')

User.create!(name: 'Gob',
             email: 'gob@hotmail.gov',
             password: 'foobarish')

# Pat should have an activeb friendship with Bob. 
# Since it is accepted, Bob should have a reverse relationship with Pat.
Friendship.create!(user_id: '1',
                   friend_id: '2',
                   accepted: true)

# Pat should have a forward relationship with Gob.
# Gob sould have a received friendship with Pat.
Friendship.create!(user_id: '1',
                   friend_id: '3',
                   accepted: false)