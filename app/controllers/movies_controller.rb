class MoviesController < ApplicationController
  
  def new
    @movie = Movie.new
  end

  def create
    movie_params = params[:movie]
    movie = Movie.find_by(title: movie_params[:title])
    unless movie
      m = Movie.add movie_params[:title]
binding.pry
      redirect_to movie_path(m.id)
    else
      redirect_to movie_path(movie.id)
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end
end