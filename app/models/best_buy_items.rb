class BestBuyItems
  def service
    BestBuyService.new
  end

  def self.find(search_criteria)
    service.products()
  end
end
