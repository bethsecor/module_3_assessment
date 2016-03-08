require 'rails_helper'

RSpec.feature "UserCanSearchForBestBuyItems", type: :feature do
  it "should be able to search for items in best buy" do
    visit root_path

    fill_in "Best Buy Products", with: "sennheiser"
    click_on "Search"

    expect(current_path).to eq search_path

    expect(page).to have_content("15 Items")

    expect(page).to have_content
  end
end
