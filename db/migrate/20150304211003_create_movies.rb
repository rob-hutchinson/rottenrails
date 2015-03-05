class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :thumbnail, null: false
      t.string :synopsis, null: false
      t.integer :rotten_id, null: false
      t.datetime :release_date

      t.timestamps null: false
    end
  end
end
