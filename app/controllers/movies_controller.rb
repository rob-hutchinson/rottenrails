class MoviesController < ApplicationController
  
  def new
    @movie = Movie.new
  end

  def create
    movie_params = params[:movie]
    movie = Movie.find_by(title: movie_params[:title].split(" ").map {|x| x.downcase.capitalize}.join(" "))
    unless movie
      m = Movie.add movie_params[:title]
      if m == nil
        flash[:alert] = "Film not found"
        redirect_to new_movie_path
      else
        redirect_to movie_path(m.id)
      end
    else
      redirect_to movie_path(movie.id)
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def index
    @movies = Movie.all
  end
end