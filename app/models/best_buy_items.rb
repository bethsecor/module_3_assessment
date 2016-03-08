class BestBuyItems
  def self.service
    BestBuyService.new
  end

  def self.find(search_criteria)
    manufacturer, attributes = search_criteria.split(" ", 2)
    service.products(manufacturer, attributes).map do |product|
      build_open_struct_object(product)
    end
  end

  private

  def self.build_open_struct_object(data)
    OpenStruct.new(data)
  end
end
