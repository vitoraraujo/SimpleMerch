class GoodsController < ApplicationController
  before_action :set_good, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]

  def searching
  end

  def search
    @goods = current_user.goods.where("quantity > ?", 0)
    @goods = @goods.where("description LIKE ?", "%#{params[:description]}%") if params[:description] != ""
    @goods = @goods.where("buy_day = ?", params[:buy_day]) if params[:buy_day] != ""
    @goods = @goods.where("buy_month = ?", params[:buy_month]) if params[:buy_month] != ""
    @goods = @goods.where("buy_year = ?", params[:buy_year]) if params[:buy_year] != ""
    @goods = @goods.where("kind LIKE ?", "%#{params[:kind]}%") if params[:kind] != ""
    @goods = @goods.where("buyed_from LIKE ?", "%#{params[:buyed_from]}%") if params[:buyed_from] != ""
    
    @stock_value = 0
    @stock_quantity = 0
    
    render template: 'goods/index' 
  end

  # GET /goods
  # GET /goods.json
  def index
    @goods = current_user.goods.where("quantity > ?", 0)
    @stock_value = 0
    @stock_quantity = 0
  end

  # GET /goods/1
  # GET /goods/1.json
  def show
  end

  # GET /goods/new
  def new
    @good = Good.new
  end

  # GET /goods/1/edit
  def edit
    if good.quantity < 1
      redirect_to root_url
    end
  end

  # POST /goods
  # POST /goods.json
  def create
    if good_params[:buy_year] == "" || good_params[:buy_year].nil?
      good_params[:buy_year] = 2018
    end

    @good = current_user.goods.build(good_params)
    if @good.save
      flash[:success] = "Mercadoria criada!"
      redirect_to goods_url
    else
      flash[:danger] = "Ops.. Algo não está correto!"
      render 'new'
    end
  end

  # PATCH/PUT /goods/1
  # PATCH/PUT /goods/1.json
  def update
    if @good.update(good_params)
      flash[:success] = "Mercadoria atualizada!"
    else
      
    end
  end

  # DELETE /goods/1
  # DELETE /goods/1.json
  def destroy
    @good.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_good
      @good = Good.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def good_params
      params.require(:good).permit(:description, :quantity, :user_id, :buy_price, :buyed_from, :buy_day, :buy_month, :buy_year, :kind, :note)
    end

    def logged_in_user
      unless logged_in?
        flash[:success]= "Por favor, faça seu Log in"
        redirect_to login_url
      end
    end
end
