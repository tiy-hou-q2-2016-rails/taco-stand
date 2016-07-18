class PasswordMailer < ApplicationMailer


  def reset_password(user)

    @user = user
    mail to: @user.email, from: "robot@taco-stand.herokuapp.com", subject: "Taco-Stand - Password Reset Request"
  end
end
