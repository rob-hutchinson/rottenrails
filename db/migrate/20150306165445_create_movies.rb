class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :rated
      t.datetime :released
      t.string :runtime
      t.string :genre
      t.string :director
      t.string :writer
      t.string :actors
      t.text :plot
      t.string :language
      t.string :country
      t.string :awards
      t.string :poster
      t.integer :metascore
      t.float :imdb_rating
      t.integer :imdb_votes
      t.string :imdb_id

      t.timestamps null: false
    end
  end
end
