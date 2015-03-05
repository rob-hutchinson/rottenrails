require 'rails_helper'

  RSpec.describe Movie, type: :model do
  
  end

  feature "Search" do

    it "should be able to search for a movie" do
      user = User.create! email: "a@example.com", password: "password"
#[todo]: breaks when user login is important

      visit new_movie_path

      fill_in "movie_title", with: "finding nemo"
      click_button "Search"

      expect(page).to have_content
    end

  end


