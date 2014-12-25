class SignupController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name,:email,:password,:password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Your account was created and signed in.'
    else
      render :new
    end
  end

end
