class OrdersController < ApplicationController
    
    def index
        @orders = Order.all
        @item = Item.find_by(params[:id])

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
        
      
        def order_params
          params.permit(
            :postal_code, :shipping_area_id, :municipality, :address, :phone_number, :token, :item_id, :building_name
            ).merge(user_id: current_user.id)
         

        end

        def pay_item
          Payjp.api_key = "sk_test_86736b5d8e4ab996c064a721"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
          Payjp::Charge.create(
            amount: @item.price,  # 商品の値段
            card: order_params[:token],    # カードトークン
            currency: 'jpy'                 # 通貨の種類（日本円）
          )
        end

end
