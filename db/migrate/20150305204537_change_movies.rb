class ChangeMovies < ActiveRecord::Migration
  def change
    rename_column :movies, :rotten_id, :imdb_id
  end
end
