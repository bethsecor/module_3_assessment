require 'rails_helper'

RSpec.feature "UserCanSearchForBestBuyItems", type: :feature do
  it "should be able to search for items in best buy" do
    visit root_path

    fill_in "Product", with: "sennheiser"
    VCR.use_cassette("best_buy#sennheiser_products") do
      click_on "Search"

      expect(current_path).to eq search_path
      expect(page).to have_content("15 Items")

      items = BestBuyItems.find('sennheiser')

      items.each do |item|
        within("#best-buy-item-#{item.sku}") do
          expect(page).to have_content item.sku
          expect(page).to have_content item.name
          expect(page).to have_content item.shortDescription
          expect(page).to have_content item.customerReviewAverage
          expect(page).to have_content item.salePrice
          expect(page).to have_css('img')
        end
      end
    end
  end
end
