desc "Report of Taco Count"
task :taco_report => :environment do
  puts "There are #{Taco.count} tacos in the system"

  ReportMailer.daily_report.deliver_now

end
