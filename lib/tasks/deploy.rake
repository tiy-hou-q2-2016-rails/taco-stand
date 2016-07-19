desc "Commit All Changes"
task :commit do
  `git add .`
  `git commit -m "Lay Git Commit"`
end

desc "Push to Github"
task :github do
  `git push origin master`
end

desc "Push to Heroku"
task :heroku do
  `git push heroku master`
  `heroku run rake db:migrate --remote heroku`
end

desc "Lazy Deploy"
task :deploy => [:commit, :github, :heroku] do
  puts "So lazy!"
end
