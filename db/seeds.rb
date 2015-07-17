## GENERATE DUMMY DATA

15.times do
  Ticket.create(
    subject: FFaker::Lorem.sentence,
    content: FFaker::Lorem.paragraph,
    status: rand(1..6),
    priority: rand(1..4),
    user_id: rand(1..3),
    assignee_id: rand(1..3)
  )
end

User.find_or_create_by(
  email: 'user1@test.com'
  ) do |u|
    u.username = 'testuser1'
    u.password = 'password'
    u.password_confirmation = 'password'
end

User.find_or_create_by(
  email: 'user2@test.com'
  ) do |u|
    u.username = 'testuser2'
    u.password = 'password'
    u.password_confirmation = 'password'
end

User.find_or_create_by(
  email: 'user3@test.com'
  ) do |u|
    u.username = 'testuser3'
    u.password = 'password'
    u.password_confirmation = 'password'
end

puts 'Seeded Database'