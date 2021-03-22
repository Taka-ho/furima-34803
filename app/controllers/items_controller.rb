class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :item_action, only: [:show, :edit, :update, :destroy]
  before_action :edit_method, only: [:edit,:update, :destroy]

  def index
    @items = Item.all.order('id DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

  end
  
  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def edit_method 
      if @item.buy.present? || @item.user_id != current_user.id
        redirect_to root_path
      end
  end

  def item_params
    params.require(:item).permit(
      :image, :name, :desctiption, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id, :price
    ).merge(user_id: current_user.id)
  end

  def item_action
    @item = Item.find(params[:id])
  end
end

