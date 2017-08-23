class WarehousesController < ApplicationController
  respond_to :json

  def index
    @warehouses = Warehouse.all
    render json: { data: @warehouses }
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)

    if @warehouse.save
      render json: {
          status: "successs", status_code: 200, message: "Warehouse registered successfully.",

          #auth_token: @user.authentication_token
      }
    else
      render json:{ status: "failure", code: 201, message: "Warehouse already Registered."}
    end

  end

  def warehouse_params
    params.require(:warehouses).permit(:user_id, :latitude,:longtitude,:imei)
  end
end
