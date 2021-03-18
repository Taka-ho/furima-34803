class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

    def index
        @items = Item.all.order("id DESC")
        @users = User.all
    end
  
    def new
        @item = Item.new
      end

    def show
      @item = Item.find(params[:id])
    end


    def create
      @item = Item.new(item_params)
        if @item.save
        redirect_to root_path
       else
        render :new
        end
    end
      
      private
        def item_params
          params.require(:item).permit(
            :image,:name, :desctiption, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id, :price
            ).merge(user_id: current_user.id)
        end
end
