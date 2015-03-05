require 'rails_helper'

  RSpec.describe Movie, type: :model do
  
  end

  feature "Search" do

    it "should be able to search for a movie" do
      user = User.create! email: "a@example.com", password: "password"

      visit new_movie_path
    end

  end


