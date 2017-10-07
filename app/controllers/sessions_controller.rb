class SessionsController < ApplicationController
  def new
  end

  def create
    @user =  User.find_by(username: params[:username])

    if logged_in?
      redirect_to root_path
    end
      if params[:username].nil? || params[:username] == ""
        render :new
      else
        user_id = @user.id
        session[:user_id] = user_id
        redirect_to root_path
      end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
