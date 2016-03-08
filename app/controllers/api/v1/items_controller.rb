class Api::V1::ItemsController < Api::V1::ApiController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def destroy
    respond_with Item.destroy(params[:id])
  end
end
