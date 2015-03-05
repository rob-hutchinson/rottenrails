class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :movie, index: true
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps null: false
    end
    add_foreign_key :comments, :users
    add_foreign_key :comments, :movies
  end
end
