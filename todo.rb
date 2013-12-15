started_f = "started.txt"
done_f = "done.txt"

require_relative 'lib'

tasks = show(started_f)

# list open tasks
puts "Tasks to complete:"
puts tasks

puts "Select action:"
puts "1. Add a new task."
puts "2. Mark a task as completed."

action = gets.chomp

if action.to_i == 1
  
  puts "Enter new task:"
  task = gets.chomp

  create(started_f, task, "a+")

  puts "You have successfully added \"#{task}\" to your open task list."

elsif action.to_i == 2

  puts "Which task have you completed?"
  task = gets.chomp.to_i

  complete(started_f, done_f, task)
end

tasks = show(started_f)
puts "Tasks to complete:\n", tasks