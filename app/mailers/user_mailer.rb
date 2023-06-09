class UserMailer < ApplicationMailer
  def welcome_mail
    @user = params[:user]
  end
end
