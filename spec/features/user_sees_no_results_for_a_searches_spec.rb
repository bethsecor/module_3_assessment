require 'rails_helper'

RSpec.feature "UserSeesNoResultsForASearches", type: :feature do
  it "should get no results when searching for sennheiser pink donut" do
    visit root_path

    fill_in "Product", with: "sennheiser pink donut"
    VCR.use_cassette("best_buy#sennheiser_pink_donut_products") do
      click_on "Search"

      expect(current_path).to eq search_path
      expect(page).to have_content("0 Items")

      expect(page).to have_content("No results.")
    end
  end
end
