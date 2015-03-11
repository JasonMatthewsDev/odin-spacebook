email = 'test@test.com'
User.create!(email: email, name: 'Jason M', password: "password", password_confirmation: "password")

50.times do
  email = Faker::Internet.email
  name  = Faker::Name.name
  User.create!(email: email, name: name, password: "password", password_confirmation: "password")
end

requester = User.first
users = User.limit(15).offset(1).order(:created_at)
users.each_with_index do |u, i|
  Friendship.create!(requester: requester, requested: u, accepted: i % 2) unless requester.id == u.id
end


7.times do
  users.each do |u|
    u.posts.create!(content: Faker::Lorem.sentence)
  end
end

users = User.limit(10).offset(16).order(:created_at)
users.each do |u|
  Friendship.create!(requester: u, requested: requester, accepted: false)
end