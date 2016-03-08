require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  it "should return a successful response and return all items" do
    item_1, item_2, item_3 = create_list(:item, 3)

    get :index, format: :json

    expect(response.status).to eq 200

    items = JSON.parse(response.body)
    api_item_1 = items.first

    expect(api_item_1['name']).to eq item_1.name
    expect(api_item_1['description']).to eq item_1.description
    expect(api_item_1['image_url']).to eq item_1.image_url
    expect(api_item_1['created_at']).to eq nil
    expect(api_item_1['updated_at']).to eq nil
  end
end
