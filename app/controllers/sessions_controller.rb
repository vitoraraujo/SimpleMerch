class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_url
    end
  end

  def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to user
      else
        flash.now[:danger] = 'Combinação e-mail/senha incorreta ou inexistente'
        render 'new'
      end
  end

  def destroy
    if logged_in?
      log_out
      redirect_to root_url
    else
      redirect_to login_url
    end
  end
end
