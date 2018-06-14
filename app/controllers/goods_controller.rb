class GoodsController < ApplicationController
  before_action :set_good, only: [:show, :edit, :update, :destroy]

  # GET /goods
  # GET /goods.json
  def index
    @goods = Good.all
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
  end

  # POST /goods
  # POST /goods.json
  def create
    @good = current_user.goods.build(good_params)
    if @good.save
      flash[:success] = "Mercadoria criada!"
      redirect_to current_user
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
end
