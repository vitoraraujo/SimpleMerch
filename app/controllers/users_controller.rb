class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:current_user_menu, :show, :index, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  # GET /users/1
  # GET /users/1.json
  def show
  end

  def index
    redirect_to current_user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Bem-vindo ao Simple Merch, o seu mais novo gerenciador de mercadorias!"
      log_in @user
      redirect_to @user
    else
      flash[:danger] = "Ops.. Algo não está correto!"
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      redirect_to current_user
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
  end

  def current_user_menu
    redirect_to current_user
  end

  def goods_history
  end

  def sales_history
  end

  def expenses_history
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
    end

    def logged_in_user
      unless logged_in?
        flash[:success]= "Por favor, faça seu Log in"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user) || current_user.admin?
    end
end