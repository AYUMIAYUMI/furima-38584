class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]

  def index
  #  @items = Item.order('created_at DESC') 一覧表示機能で実装する内容のため現段階ではコメントアウト
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

  private

  def item_params
    params.require(:item).permit(:product_name, :discription, :image, :category_id, :condition_id, :price, :shipping_info_id,
                                 :shipping_area_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to  '/users/sign_in'
    end
  end
end
