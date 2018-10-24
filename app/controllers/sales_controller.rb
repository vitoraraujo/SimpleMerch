class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  
  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @good = Good.find(params[:param])
    redirect_to(goods_url) unless current_user.id == @good.user_id || current_user.admin? || @good.quantity == 0
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    if sale_params[:sell_year] == "" || sale_params[:sell_year].nil?
      sale_params[:sell_year] = 2018
    end

    @sale = current_user.sales.build(sale_params)
    @good = Good.find(sale_params[:good_id])
    if sale_params[:sell_year] == ""
      sale_params[:sell_year] = 2018
    end
    if @sale.quantity > @good.quantity
      flash[:danger] = "Não venda além do que possui.."
      redirect_to goods_url
    else
      if @sale.save
        quantity = @good.quantity - @sale.quantity
        if @good.update(:quantity => quantity)
          flash[:success] = "Venda realizada!"
          redirect_to goods_url          
        end
      else
        redirect_to goods_url
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    if @sale.update(sale_params)
      redirect_to current_user
    else
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    if @sale.destroy
      redirect_to current_user
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:user_id, :good_id, :quantity, :sell_price, :sold_to, :sell_day, :sell_month, :sell_year)
    end
end
