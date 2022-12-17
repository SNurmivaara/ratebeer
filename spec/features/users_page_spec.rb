require 'rails_helper'

include Helpers

def confirm
  js? ? accept_confirm { yield } : yield
end

describe "User" do
  before :each do
     @user = FactoryBot.create :user
     @otheruser = FactoryBot.create :user, username: "somebody"
     @brewery = FactoryBot.create :brewery, name: "Testbrewery"
     @beer = FactoryBot.create :beer, name: "Testbeer", brewery: @brewery
     FactoryBot.create(:rating, beer: @beer, user: @user)
     FactoryBot.create(:rating, beer: @beer, user: @user)
     FactoryBot.create(:rating, beer: @beer, score: 25, user: @otheruser)
  end

  describe "who has signed up" do
    it "can signin with right credentials" do
      sign_in(username: "Pekka", password: "Foobar1")

      expect(page).to have_content 'Welcome back!'
      expect(page).to have_content @user.username
    end

    it "is redirected back to signin form if wrong credentials given" do
      sign_in(username: "Pekka", password: "wrong")

      expect(current_path).to eq(signin_path)
      expect(page).to have_content 'Username and/or password mismatch'
    end

    it "can see only own ratings" do
      sign_in(username: "Pekka", password: "Foobar1")
      expect(page).to have_content 'Has made 2 ratings'
      expect(page).not_to have_content '25'
    end

    it "can see favorite style" do
      sign_in(username: "Pekka", password: "Foobar1")
      expect(page).to have_content 'Favorite beer style: Lager'
    end

    it "can see favorite brewery" do
      sign_in(username: "Pekka", password: "Foobar1")
      expect(page).to have_content 'Favorite brewery: Testbrewery'
    end

  end

  it "when signed up with good credentials, is added to the system" do
    visit signup_path
    fill_in('user_username', with: 'Brian')
    fill_in('user_password', with: 'Secret55')
    fill_in('user_password_confirmation', with: 'Secret55')
  
    expect{
      click_button('Create User')
    }.to change{User.count}.by(1)
  end
end