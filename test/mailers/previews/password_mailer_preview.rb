# Preview all emails at http://localhost:3000/rails/mailers/password_mailer
class PasswordMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/password_mailer/reset_password
  def reset_password
    user = User.first
    user.reset_password_token = SecureRandom.hex
    user.reset_password_token_expiration = 3.hours.from_now
    PasswordMailer.reset_password(user)
  end

end
