

ticket_number = 'T'+Time.now.strftime('%m%d%y')+'.'+sprintf('%03d', 10)

t = ticket_number[8..10]

puts t