class ReportMailer < ApplicationMailer

  def daily_report(tacos)
    @tacos = tacos
    mail to: "jesse@theironyard.com", subject: "Daily Taco Report", from: "robot@taco-stand.herokuapp.com"
  end
end
