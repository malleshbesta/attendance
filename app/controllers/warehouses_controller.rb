class WarehousesController < ApplicationController
  respond_to :json

  def index
    @warehouses = Warehouse.all
    render json: { data: @warehouses }
  end
end
