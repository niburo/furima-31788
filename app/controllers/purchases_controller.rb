class PurchasesController < ApplicationController

  def index
    @addresse_purchase = AddressePurchase.new
    @item = Item.find(params[:item_id])
  end


  def create
    @addresse_purchase = AddressePurchase.new(purchases_params)
    if @addresse_purchase.valid?
       @addresse_purchase.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchases_params
      params.permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :order_id, :user_id, :item_id)
  end

end

