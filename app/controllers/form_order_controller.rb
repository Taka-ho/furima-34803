class FormOrderController < ApplicationController
    before_action :authenticate_user!, except: :index
  
    def index
    end
  
    def new
      @order = Order.new
    end
  
    def create
      @order = Order.new(order_buy_params)
      if @order.valid?
        @order.save
        redirect_to root_path
      else
        render :new
      end
    end
  
    private
  
    def order_buy_params
      params.permit(
          :authenticity_token, :postal_code, :shipping_area_id, :municipality, :address, :phone_number, :token, :item_id).merge(user_id: current_user.id)
    end
  
  
  end