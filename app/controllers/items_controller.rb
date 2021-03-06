class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :edit]
  before_action :set_item,only: [:edit,:show,:update,:destroy]

  def index
    @item = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
   end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path
    else
       render :new
    end
  end

  def show
  end
  
  def edit
   redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
       redirect_to item_path(@item.id)
    else
       render :edit
    end
  end

  def destroy
    redirect_to root_path unless current_user.id == @item.user_id
    @item.destroy
    redirect_to root_path
  end



  private
   def item_params
     params.require(:item).permit(:name, :image, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
   end

   def set_item
      @item = Item.find(params[:id])
   end

end