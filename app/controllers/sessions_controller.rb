class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash = request.env['omniauth.auth']
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = user.id
      redirect_to root_path, notice: ', you are signed in'
    else

      @user = User.find_by(username: params[:username])

      if !@user
        flash[:warning] = "Please check you information, and try again"
        redirect_to root_path
      elsif
        @user.authenticate(params[:password])
        user_id = @user.id
        session[:user_id] = user_id
        redirect_to root_path, notice: ', you are signed in'
      else
        flash[:alert] = "Incorrect password"
        render :new
      end
    end

  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
