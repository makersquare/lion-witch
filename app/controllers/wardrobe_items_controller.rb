class WardrobeItemsController < ApplicationController
  def index
    @wardrobe_items = WardrobeItem.all

    respond_to do |format|
      format.html
      format.json { render json: @wardrobe_items }
    end
  end

  def show
    @wardrobe_item = WardrobeItem.find(params[:id])
  end

  def new
    @wardrobe_item = WardrobeItem.new
  end

  def edit
    @wardrobe_item = WardrobeItem.find(params[:id])
  end

  def create
    @wardrobe_item = WardrobeItem.new(wardrobe_item_params)

    if @wardrobe_item.save
      redirect_to @wardrobe_item, notice: "Wardrobe Item was successfully created"
    else
      render action: 'new'
    end
  end

  def update
    @wardrobe_item = WardrobeItem.find(params[:id])

    if @wardrobe_item.update(wardrobe_item_params)
      redirect_to @wardrobe_item, notice: "Wardrobe Item was successfully updated"
    else
      render action: 'edit'
    end
  end

  def destroy
    @wardrobe_item = WardrobeItem.find(params[:id])
    @wardrobe_item.destroy

    redirect_to wardrobe_items_url
  end

  private
    def wardrobe_item_params
      params.require(:wardrobe_item).permit(:garment, :label, :season, :color)
    end
end
