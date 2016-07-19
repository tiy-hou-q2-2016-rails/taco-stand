desc "Say Hi"
task :say_hi do
  puts "Hiiiiiiii"
end

desc "Say Bi"
task :say_bi => :say_hi do
  puts "Biiiiiiiii"
end
