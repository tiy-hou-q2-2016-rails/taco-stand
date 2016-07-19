desc "Report of Taco Count"
task :taco_report => :environment do

  if Date.today.day == 1
    puts "There are #{Taco.count} tacos in the system"

    @tacos = Taco.where("created_at >?", 1.month.ago)

    ReportMailer.daily_report(@tacos).deliver_now
  end
end
