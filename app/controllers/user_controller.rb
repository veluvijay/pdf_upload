class UserController < ApplicationController
  def default_page
  end

  def sign_up
  end

  def register_user
    password = Digest::MD5.hexdigest(params[:user][:password])
    params[:user].merge!(:password=>password)
    user_params = params.require(:user).permit(:email_id,:password)
    User.create(user_params)
    redirect_to root_path, notice: "You have been signned up."
  end

  def login
    email = params[:user][:email_id]
    pwd = params[:user][:password]
    password = Digest::MD5.hexdigest(pwd)
    @user = User.where("email_id = ? and password = ?",email,password).first
  end

end
