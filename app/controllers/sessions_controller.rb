class SessionsController < ApplicationController
  def new
  end

  def create
    if session[:username].present?
      redirect_to root_path
    end
      if params[:username].nil? || params[:username] == ""
        render :new
      else
        username = params[:username]
        session[:username] = username
        redirect_to root_path
      end 
  end

  def destroy
    session.delete :username
    redirect_to root_path
  end
end
