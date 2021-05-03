class OrdersController < ApplicationController


  def index
     @orders= OrderAddress.new
     @item = Item.find(params[:item_id])
  end

  def  create
    
    @orders= OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    
    if @orders.valid?
      pay_item
       @orders.save
       return redirect_to root_path
    else
      render :index
    end
  end


  private

  def  order_params
    params.require(:order_address).permit( :postal_code, :area_id, :municipality, :house_number, :building, :phone ).merge(token: params[:token],item_id: params[:item_id], user_id: current_user.id)
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price, 
    card: order_params[:token],    
    currency: 'jpy'                
  )
end
end
