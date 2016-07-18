class ShareMailer < ApplicationMailer

  def share_taco(email_recipient, taco)
    @greeting = "YO YO YO "

    @taco = taco

    mail to: email_recipient, from: "robot@taco-stand.herokuapp.com", subject: "Super cool taco for you"
  end
end
