# Create 5 auditoria
auditorium_numbers = [
  "Auditorium 1",
  "Auditorium 2",
  "Auditorium 3",
  "Auditorium 4",
  "Auditorium 5"
]

capacity = [1, 2, 3, 4, 5]

auditorium_numbers.each_with_index do |auditorium_title, i|
  Auditorium.find_or_create_by!(title: auditorium_title) do |auditorium|
    auditorium.capacity = capacity[i]
  end
end

auditoria = Auditorium.all

# Create 5 Movies
titles = [
  "Manchester by the Sea",
  "Fences",
  "Hidden Figures",
  "Moonlight",
  "Arrival"
]

titles.each do |title|
  Movie.find_or_create_by!(title: title)
end

movies = Movie.all

# Create 10 showtimes, using the movies and auditoria
10.times do
  day = rand(1..14)
  Showtime.create!(
    time: ((Time.zone.now + day.days).end_of_day + 1.minute) - rand(1..4).hours,
    movie: movies.sample,
    auditorium: auditoria.sample
  )
end

showtimes = Showtime.all

# Create 5 orders, using the showtimes
5.times do
  Order.create!(
    name: "Brock McNuggets",
    email: "brock@mail.com",
    credit_card_number: "378282246310005",
    expiration_date: "12/09/2017",
    showtime: showtimes.sample
  )
end
