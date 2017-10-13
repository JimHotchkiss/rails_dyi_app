class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash = request.env['omniauth.auth']
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = user.id
      redirect_to root_path, notice: ', you are signed in'

    else
    # else we are gong to use our normal authentication login
      @user = User.find_by(username: params[:username])

      if @user
        return redirect_to root_path unless @user.authenticate(params[:password])
        user_id = @user.id
        session[:user_id] = user_id
        redirect_to root_path, notice: ', you are signed in'
      else
        redirect_to root_path, notice: 'you need to be signed up'
      end
    end

  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
