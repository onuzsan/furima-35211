class OrdersController < ApplicationController


  def index
     @orders= OrderAddress.new
     @item = Item.find(params[:item_id])
  end

  def  create
    
  end
end
