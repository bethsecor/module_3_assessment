class BestBuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "https://api.bestbuy.com/v1/")
    connection.params['apiKey'] = ENV['BEST_BUY_KEY']
    connection.params['format'] = 'json'
  end

  def products
    # https://api.bestbuy.com/v1/products(manufacturer=canon&salePrice<1000)?format=json&show=sku,name,salePrice&apiKey=YourAPIKey'
    parse(connection.get("products"))
  end

  private

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
