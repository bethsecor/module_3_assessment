require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  it "index should return a successful response and return all items" do
    item_1, item_2, item_3 = create_list(:item, 3)

    get :index, format: :json

    expect(response.status).to eq 200

    items = JSON.parse(response.body)
    api_item_1 = items[0]
    api_item_2 = items[1]
    api_item_3 = items[2]

    expect(api_item_1['name']).to eq item_1.name
    expect(api_item_1['description']).to eq item_1.description
    expect(api_item_1['image_url']).to eq item_1.image_url
    expect(api_item_1['created_at']).to eq nil
    expect(api_item_1['updated_at']).to eq nil

    expect(api_item_2['name']).to eq item_2.name
    expect(api_item_2['description']).to eq item_2.description
    expect(api_item_2['image_url']).to eq item_2.image_url

    expect(api_item_3['name']).to eq item_3.name
    expect(api_item_3['description']).to eq item_3.description
    expect(api_item_3['image_url']).to eq item_3.image_url
  end

  it "show should return a successful response and return an item" do
    item_1, item_2, item_3 = create_list(:item, 3)

    get :show, id: item_1.id, format: :json

    expect(response.status).to eq 200

    api_item_1 = JSON.parse(response.body)

    expect(api_item_1['name']).to eq item_1.name
    refute(api_item_1['name']).to eq item_2.name
    expect(api_item_1['description']).to eq item_1.description
    expect(api_item_1['image_url']).to eq item_1.image_url
    expect(api_item_1['created_at']).to eq nil
    expect(api_item_1['updated_at']).to eq nil
  end
end
