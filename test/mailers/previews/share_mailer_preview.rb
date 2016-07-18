# Preview all emails at http://localhost:3000/rails/mailers/share_mailer
class ShareMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/share_mailer/share_taco
  def share_taco
    # If controller does this:
    # ShareMailer.share_taco(email).deliver_now

    # the preview needs to do this:
    taco = Taco.first
    ShareMailer.share_taco("jesse@example.com", taco)
  end

end
