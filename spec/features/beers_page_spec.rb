require 'rails_helper'

include Helpers

describe "Beers page" do
  let!(:brewery) { FactoryBot.create :brewery, name: "Koff" }
  let!(:user) { FactoryBot.create :user }
  let!(:style) { FactoryBot.create :style }

  before :each do
    sign_in(username: "Pekka", password: "Foobar1")
  end

  it "you can add a beer if the name is valid" do
    visit new_beer_path
    fill_in('beer[name]', with: 'testikalja')
    
    expect{
      click_button "Create Beer"
    }.to change{Beer.count}.from(0).to(1)
  end

  it "you can not add a beer if the name is invalid" do
    visit new_beer_path

    expect{
      click_button "Create Beer"
    }.not_to change{Beer.count}

    expect(page).to have_content 'Name can\'t be blank'
  end
end