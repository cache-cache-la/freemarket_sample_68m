# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def login
    @aaa = abc
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      flash[:notice] = "ログインしました"
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
    end
  end
end
