require 'httparty'

class Movie < ActiveRecord::Base

  include HTTParty

  def self.search title
    JSON.parse(HTTParty.get("http://www.omdbapi.com/?t=#{title}&plot=short&type=movie&r=json"))
  end

  def self.add title
    movie_bits = self.search title
    if movie_bits != nil
      Movie.create! title: movie_bits["Title"], year: movie_bits["Year"],
        rated: movie_bits["Rated"], released: movie_bits["Released"], runtime: movie_bits["Runtime"],
        genre: movie_bits["Genre"], director: movie_bits["Director"], writer: movie_bits["Writer"],
        actors: movie_bits["Actors"], language: movie_bits["Language"], country: movie_bits["Country"],
        awards: movie_bits["Awards"], poster: movie_bits["Poster"], metascore: movie_bits["Metascore"],
        imdb_rating: movie_bits["imdbRating"], imdb_votes: movie_bits["imdbVotes"],
        plot: movie_bits["Plot"], imdb_id: movie_bits["imdbID"]
    else
      flash.now[:alert] = "Film not found"
      render :new
    end
  end

end
