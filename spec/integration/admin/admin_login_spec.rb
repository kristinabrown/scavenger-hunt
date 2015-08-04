require "rails_helper"

feature "admin logs in" do
  let!(:admin) {create(:admin)}
  
  xscenario "with valid credentials" do 
    visit root_path
    click_link "Admin"
    fill_in "session[name]", with: "NerdHerder"
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