require 'rails_helper'

RSpec.feature "GuestCanSeeItemsOnPages", type: :feature do
  it "can see items on the homepage" do
    items = create_list(:item, 3)

    visit root_path

    within('h1') do
      expect(page).to have_content("3 Items")
    end

    expect(page).to have_content("#{items.first.name}")
  end
end
