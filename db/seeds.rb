## GENERATE DUMMY TICKETS

15.times do
  Ticket.create(
    subject: FFaker::Lorem.sentence,
    content: FFaker::Lorem.paragraph,
    status: 1,
    priority: 2,
    user_id: 1,
    assignee_id: 2
  )
end

puts 'Seeded Dummy Tickets'