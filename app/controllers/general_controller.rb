class GeneralController < ApplicationController
  before_action :logged_in_user, only: [:current_user_menu, :show, :index, :edit, :update, :destroy]

	def general
		@goods = current_user.goods.all
    @sales = current_user.sales.all
    @expenses = current_user.expenses.all

    @profit = 0
    @cost = 0
	end

	def search
    @goods = current_user.goods.all
    @expenses = current_user.expenses.all
    @sales = current_user.sales.all

    @profit = 0
    @cost = 0
    
    if params[:day] != ""
      @goods = @goods.where("buy_day = ?", params[:day])
      @expenses = @expenses.where("day = ? ", params[:day])
      @sales = @sales.where("sell_day = ?", params[:day])
    end

    if params[:month] != ""
      @goods = @goods.where("buy_month = ?", params[:month])
      @expenses = @expenses.where("month = ? ", params[:month])
      @sales = @sales.where("sell_month = ?", params[:month])
    end

    if params[:year] != ""
      @goods = @goods.where("buy_year = ?", params[:year])
      @expenses = @expenses.where("year = ? ", params[:year])
      @sales = @sales.where("sell_year = ?", params[:year])
    end

    if params[:description] != ""
      @goods = @goods.where("description LIKE ?", "%#{params[:description]}%")
      @sales = @sales.joins(:good).where("description LIKE ?", "%#{params[:description]}%")

    end

    if params[:kind] != ""
      @goods = @goods.where("kind LIKE ?", "%#{params[:kind]}%")
      @sales = @sales.joins(:good).where("kind LIKE ?", "%#{params[:kind]}%")
    end

    if params[:buyed_from] != ""
      @goods = @goods.where("buyed_from LIKE ?", "%#{params[:buyed_from]}%")
      @sales = @sales.joins(:good).where("buyed_from LIKE ?", "%#{params[:buyed_from]}%")
    end

    if params[:expense_reason] != ""
      @expenses = @expenses.where("reason LIKE ?", "%#{params[:expense_reason]}")
    end

    if params[:expense_kind] != ""
      @expenses = @expenses.where("kind LIKE ?", "%#{params[:expense_kind]}")
    end

    if params[:sold_to] != ""
      @sales = @sales.where("sold_to LIKE ?", "%#{params[:sold_to]}%")
      @goods = @goods.joins(:sale).where("sold_to LIKE ?", "%#{params[:sold_to]}%")
    end

    render :general
  end

  private
    def search_params
      params.require(:general).permit(:description, :day, :month, :year, :expense_kind, :expense_reason, :buyed_from, :sold_to)
    end

    def logged_in_user
      unless logged_in?
        flash[:success]= "Por favor, faça seu Log in"
        redirect_to login_url
      end
    end

end
