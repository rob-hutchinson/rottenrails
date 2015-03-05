class Movie < ActiveRecord::Base
require 'omd'

  def self.add title
    movie_bits = Omd.search title
    if movie_bits != nil
      Movie.create! title: movie_bits["Title"], thumbnail: movie_bits["Poster"], 
        synopsis: movie_bits["Plot"], imdb_id: movie_bits["imdbID"]
    else
      flash.now[:alert] = "Film not found"
      render :new
    end     
  end


end
