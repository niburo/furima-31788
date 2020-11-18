class PurchasesController < ApplicationController
  before_action :authenticate_user!,only: [:index]

  def index
    @addresse_purchase = AddressePurchase.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase != nil
  end


  def create
    @addresse_purchase = AddressePurchase.new(purchases_params)
    @item = Item.find(params[:item_id])
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
      params.permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :order_id, :item_id, :token).merge(user_id: current_user.id)
      #今回はトークンはマージではなくパーミットで渡してあげたい
  end

  def pay_item
    Payjp.api_key = "sk_test_8c6c4476fc4bc54512881c10"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchases_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end

