
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'json'

url = 'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=vote_average.desc&without_genres=99,10755&vote_count.gte=200' \
response = URI.open(url)
movies_data = JSON.parse(response.read)

movies_data.each do |movie_data|
  movie = Movie.new(
    title: movie_data['title'],
    overview: movie_data['overview'],
    rating: moview_data['rating'],
    poster_url: movie_data['image_url']
  )
  movie.save!
end
