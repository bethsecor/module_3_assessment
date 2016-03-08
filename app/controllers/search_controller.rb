class SearchController < ApplicationController
  def index
    @best_buy_items = BestBuyItems.find(search_params[:product])
  end

  private

  def search_params
    params.require(:search_best_buy).permit(:product)
  end
end
