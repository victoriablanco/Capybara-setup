Event.delete_all

15.times do |i|
  Event.create!(
    description: "Event #{i}",
    location: "Location #{i}",
    requires_id: [true, false].sample,
    capacity: rand(45),
    date: (2.years.ago.to_date..Date.today).to_a.sample,
  )
end
