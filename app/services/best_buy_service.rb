class BestBuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "https://api.bestbuy.com/v1/")
    connection.params['apiKey'] = ENV['BEST_BUY_KEY']
    connection.params['format'] = 'json'
  end

  def products(manufacturer, attributes=nil)
    if attributes
      filter = attributes.split(" ").map { |a| "longDescription=#{a}*" }.join("&")
      parse(connection.get("products(manufacturer=#{manufacturer}&#{filter})",
                          {show: "sku,name,customerReviewAverage,shortDescription,salePrice,image",
                           pageSize: 15}))[:products]
    else
      parse(connection.get("products(manufacturer=#{manufacturer})",
                          {show: "sku,name,customerReviewAverage,shortDescription,salePrice,image",
                           pageSize: 15}))[:products]
    end
  end

  private

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
