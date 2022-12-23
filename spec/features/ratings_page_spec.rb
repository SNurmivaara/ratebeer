require 'rails_helper'

include Helpers

describe "Ratings page" do
  let!(:brewery) { FactoryBot.create :brewery, name: "Koff" }
  let!(:beer1) { FactoryBot.create :beer, name: "iso 3", brewery:brewery }
  let!(:beer2) { FactoryBot.create :beer, name: "Karhu", brewery:brewery }
  let!(:user) { FactoryBot.create :user }
  let!(:rating1) { FactoryBot.create :rating, user: user }
  let!(:rating2) { FactoryBot.create :rating, user: user }

  before :each do
    sign_in(username: "Pekka", password: "Foobar1")
  end

  it "lists the ratings" do
    visit ratings_path
    expect(page).to have_content "Karhu"
  end

  it "when a new rating is given, it is registered to the beer and user who is signed in" do

    visit new_rating_path
    select('iso 3', from: 'rating[beer_id]')
    fill_in('rating[score]', with: '15')

    expect{
      click_button "Create Rating"
    }.to change{Rating.count}.from(2).to(3)

    expect(user.ratings.count).to eq(3)
    expect(beer1.ratings.count).to eq(1)
    expect(beer1.average_rating).to eq(15.0)
  end
end