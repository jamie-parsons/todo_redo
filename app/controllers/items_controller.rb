class ItemsController < ApplicationController
  before_action :set_item, except: [:create, :new, :index
]
  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def update

    if Item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_path
    else 
      render :new
    end
  end

  def destroy
    @item.destroy
    flash[:notice] = 'Item Deleted!'
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :deadline, :detail)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
