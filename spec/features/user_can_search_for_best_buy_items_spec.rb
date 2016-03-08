require 'rails_helper'

RSpec.feature "UserCanSearchForBestBuyItems", type: :feature do
  it "should be able to search for items in best buy" do
    visit root_path

    fill_in "Product", with: "sennheiser"
    VCR.use_cassette("best_buy#sennheiser_products") do
    click_on "Search"

    expect(current_path).to eq search_path

    expect(page).to have_content("15 Items")
    end
  end
end
