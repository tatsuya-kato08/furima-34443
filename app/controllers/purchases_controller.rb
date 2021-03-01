class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :purchase_item, only: [:index, :create]
  before_action :item_record, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new 
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid? 
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def purchase_params
    params.require(:purchase_address).permit(:code, :area_id, :city, :number, :building, :phone).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def purchase_item
    @item = Item.find(params[:item_id])
    if current_user == @item.user || @item.purchase.present?
      redirect_to root_path
    end
  end

  def item_record
    @item = Item.find(params[:item_id])
  end

end
