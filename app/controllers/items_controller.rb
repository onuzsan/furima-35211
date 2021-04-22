class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
  end
  
  def new
     @item = Item.new
  end

  def create 
     @item = Item.new(item_params)
     
     @item .save
     redirect_to root_path
    
  end








  private
  def item_params
    params.require(:item).permit(:image,:title,:description, :category_id,:status_id,:shipping_id,:area_id,:schedule_id,:price,).merge(user_id: current_user.id)
  end

    def move_to_index
     unless user_signed_in?
     redirect_to action: :index
    end
  end
end
