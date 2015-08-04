require "rails_helper"

RSpec.feature "Admin Dashboard" do
  xscenario "has a dashboard route" do
    visit dashboard_path

    expect(page).to have_css('#standings')
    expect(page).to have_css('#submissions')
  end
end
