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
end
