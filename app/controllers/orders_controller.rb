class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new,:index]
  before_action :set_item, only: [:create, :index]
  def index
     if current_user == :user_id
     redirect_to root_path
     else
    @orders = OrderAddress.new
    
  end
end

  def create
    @orders = OrderAddress.new(order_params)
   

    if @orders.valid?
      pay_item
      @orders.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_item
  @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :area_id, :municipality, :house_number, :building, :phone).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
end
end
