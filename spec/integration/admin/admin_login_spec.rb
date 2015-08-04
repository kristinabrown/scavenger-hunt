require "rails_helper"

feature "admin logs in" do
  # let!(:admin) {Admin.create!(name: "NerdHerder", phone: "555-555-5555", password: "password")}
  
  xscenario "with valid credentials" do
    Admin.create!(name: "Raissa", phone: "555-333-5555", password: "password")
    visit root_path
    click_link "Admin"
    fill_in "session[name]", with: "Raissa"
    fill_in "session[password]", with: "password"
    click_link_or_button "Login"
    
    expect(page).to have_content("Welcome, NerdHerder!")
  end
  
  xscenario "with invalid credentials" do 
    visit root_path
    click_link "Admin"
    fill_in "session[name]", with: "Blah"
    fill_in "session[password]", with: "password"
    click_link_or_button "Login"
    
    expect(page).to have_content("Something went terribly wrong.")
  end
  
  
  xscenario "can logout" do 
    visit root_path
    click_link "Admin"
    fill_in "session[name]", with: "Blah"
    fill_in "session[password]", with: "password"
    click_link_or_button "Login"
    
    expect(page).to have_content("Logout")
    
    click_link "Logout"
    
    expect(page).to have_content("Admin")
  end
end