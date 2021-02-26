class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new  
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def purchase_params
    params.require(:purchase_address).permit(:code, :area_id, :city, :number, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
