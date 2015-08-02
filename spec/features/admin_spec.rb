require "rails_helper"

RSpec.feature "Admin Dashboard" do
  scenario "has a dashboard route" do
    visit admin_dashboard_path

    expect(page).to have_css('#standings')
    expect(page).to have_css('#submissions')
  end
end
