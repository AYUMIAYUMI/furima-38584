class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    if item.save
      redirect_to item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :discription, :image, :category_id, :condition_id, :price, :shipping_info_id,
                                 :shipping_area_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    return if user_signed_in?

    redirect_to '/users/sign_in'
  end
end
