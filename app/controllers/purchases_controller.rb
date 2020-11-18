class PurchasesController < ApplicationController
  before_action :authenticate_user!,only: [:index]
  before_action :set_item,only: [:index, :create]

  def index
    @addresse_purchase = AddressePurchase.new
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase != nil
  end


  def create
    @addresse_purchase = AddressePurchase.new(purchases_params)
    if @addresse_purchase.valid?
       pay_item
       @addresse_purchase.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchases_params
      params.permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :item_id, :token).merge(user_id: current_user.id)
      #今回はトークンはマージではなくパーミットで渡してあげたい
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchases_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

