email = 'kid.bytes@gmail.com'
User.create!(email: email, password: "password", password_confirmation: "password")

50.times do
  email = Faker::Internet.email
  User.create!(email: email, password: "password", password_confirmation: "password")
end

requester = User.first
users = User.take(15)
users.each_with_index do |u, i| 
  Friendship.create!(requester: requester, requestee: u, status: i % 2) unless requester.id == u.id
end