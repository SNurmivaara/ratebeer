require 'rails_helper'

describe "Places" do
  it "if one is returned by the API, it is shown at the page" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
      [ Place.new( name: "Oljenkorsi", id: 1 ) ]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "Oljenkorsi"
  end

  it "if multiple are returned by the API, they are shown at the page" do
    allow(BeermappingApi).to receive(:places_in).with("stadi").and_return(
      [ Place.new( name: "Oljenkorsi", id: 1 ), Place.new( name: "Basso", id: 2 ), Place.new( name: "Coolhead", id: 3 ) ]
    )

    visit places_path
    fill_in('city', with: 'stadi')
    click_button "Search"

    expect(page).to have_content "Oljenkorsi"
    expect(page).to have_content "Basso"
    expect(page).to have_content "Coolhead"
  end

  it "if none are returned by the API, page shows correct error message" do
    allow(BeermappingApi).to receive(:places_in).with("moon").and_return(
      []
    )

    visit places_path
    fill_in('city', with: 'moon')
    click_button "Search"

    expect(page).to have_content "No locations in moon"
  end
end