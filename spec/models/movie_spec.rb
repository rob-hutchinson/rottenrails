require 'rails_helper'

  RSpec.describe Movie, type: :model do

  end

  feature "Search" do

    it "should be able to search for a movie" do
      # u = create_user!
#[todo:]breaks when user login is important
      visit new_movie_path
      fill_in "movie_title", with: "finding nemo"
      click_button "Search"
      expect(page).to have_content "Title: Finding Nemo"
    end

    it "doesn't care about capitalization" do
      # u = create_user!
      visit new_movie_path
      fill_in "movie_title", with: "fINDINg NeMo"
      click_button "Search"
      expect(page).to have_content "Title: Finding Nemo"
    end

    it "should not add the same movie that has already been added" do
      # u = create_user!
      visit new_movie_path
      fill_in "movie_title", with: "frozen"
      click_button "Search"
      visit new_movie_path
      fill_in "movie_title", with: "frozen"
      click_button "Search"
      expect(Movie.all.count).to eq 1
    end

  end

  feature "Index" do

    it "should show a list of film boards" do
      # u = create_user!
      m1 = create_movie! title:"Snatch"
      m2 = create_movie! title:"Finding Nemo"      
      visit movies_path
      expect(page).to have_content "Finding Nemo"
      expect(page).to have_content "Snatch"
    end

    it "should link you to a movie page" do
      # u = create_user!
      m = create_movie! title:"Snatch", rated:"PG"
      visit movies_path
      click_on "Snatch"
      expect(page).to have_content "PG"
    end

  end








