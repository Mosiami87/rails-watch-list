
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'json'

url = 'https://tmdb.lewagon.com/movie/top_rated'
response = URI.open(url)
movies_data = JSON.parse(response.read)
relevant_infos = movies_data['results']

relevant_infos.each do |movie_data|
  movie = Movie.new(
    title: movie_data["original_title"],
    overview: movie_data['overview'],
    rating: movie_data["vote_average"],
    poster_url: movie_data["poster_path"]
  )
  movie.save!
end
