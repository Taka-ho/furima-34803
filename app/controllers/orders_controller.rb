class OrdersController < ApplicationController
    
    def index
        @orders = Order.all
        @item = Item.find_by(params[:id])

      end 
      
      def create
        @order = Order.new(order_params)
       if @order.save
        redirect_to root_path
       else
        render :order
      end
      
      private
        
      
        def order_params
          params.permit(:order).permit(
           :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number
          )
        end
end
end
