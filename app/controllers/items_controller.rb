class ItemsController < ApplicationController

  # GET /items
  # GET /items.json

  before_filter :authenticate_user!
  before_filter :ensure_admin, :only => [:new, :create, :edit, :destroy]

  #before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end


  def ensure_admin
    unless current_user && current_user.admin?
      render :text => "Access Error Message", :status => :unauthorized end
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  def category
    @items=item.find_all_by_category(params[:id])
    @category=params[:id]

    respond_to do |format|
      format.html #index.html.erb
      format.json {render json: @items}
    end
  end

  def search
    @search_item=params[:q]
    st="%"{params[:q]}%"
    @items = Item.where("Title like ? or Description like ?", st, st)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :description, :price, :image_url, :category)
    end
end
