class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      if @user.authenticate(params[:password])
        flash[:success] = 'Signed in successfully'
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash[:error] = 'Wrong password'
        render 'new'
      end
    else
      flash[:info] = 'User not found'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash: {info: 'Signed out'}
  end

  def callback
    if user = User.from_omniauth(env["omniauth.auth"])
      flash[:success] = 'Signed in by Facebook successfully'
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Error while signing in by Facebook. Let's register"
      redirect_to new_user_path
    end
  end
end
