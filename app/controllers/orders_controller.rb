class OrdersController < ApplicationController
  before_action :authenticate_user!
   before_action :index_method, only: [:index]
    
    def index
      @item = Item.find_by(params[:id])
      @orders = Order.all
      @order = FormOrder.new
    end

    
      def create
        @item = Item.find_by(params[:id])
        @order = FormOrder.new(order_params)
       if @order.valid?
        pay_item
        @order.save
        redirect_to root_path
       else
        render :index
        end
      end      
      private
      
      def index_method 
        @item = Item.find_by(params[:id])
          if @item.buy.present? || @item.user_id == current_user.id
            redirect_to root_path
          end
      end
      
        def order_params
          params.require(:form_order).permit(
            :postal_code, :shipping_area_id, :municipality, :address, :phone_number, :token, :item_id, :building_name
            ).merge(user_id: current_user.id)
         

        end

        def pay_item
          Payjp.api_key = "sk_test_86736b5d8e4ab996c064a721"
          Payjp::Charge.create(
            amount: @item.price,  
            card: order_params[:token],    
            currency: 'jpy'              
          )
        end

        
end
