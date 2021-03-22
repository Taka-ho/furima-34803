class OrdersController < ApplicationController
  before_action :authenticate_user!
   before_action :index_method, only: [:index, :create]
   before_action :params_method, only: [:index, :create, :index_method ]

    def index
      @order = FormOrder.new
    end

    
      def create
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
    def params_method
      @item = Item.find_by(params[:id])
    end
      
      def index_method 
          if @item.buy.present? || @item.user_id == current_user.id
            redirect_to root_path
          end
      end
      
        def order_params
          params.require(:form_order).permit(
            :postal_code, :shipping_area_id, :municipality, :address, :phone_number, :token, :building_name
            ).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])

        end

        def pay_item
          Payjp.api_key = "PAYJP_SECRET_KEY"
          Payjp::Charge.create(
            amount: @item.price,  
            card: order_params[:token],    
            currency: 'jpy'              
          )
        end

        
end
