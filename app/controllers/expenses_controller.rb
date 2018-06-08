class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = Expense.all
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = current_user.expenses.build(expense_params)
    if @expense.save
      flash[:success] = "Despesa cadastrada"
      redirect_to root_path
    else
      flash[:danger] = "Ops.. Algo não está de acordo!"
      reder 'new'
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    if @expense.update(expense_params)
      flash[:success] = "Conta atualizada!"
    else
      flash[:danger] = "Ops.. Algo não está de acordo!"
      render 'edit'
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    if @expense.destroy
      flash[:success] = "Conta excluida"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:user_id, :kind, :cost, :reason, :day, :month, :year)
    end
end
