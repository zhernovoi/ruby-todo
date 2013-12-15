started_f = "started.txt"
done_f = "done.txt"

require_relative 'lib'

open = list(started_f)

# list open tasks
puts "Tasks to complete:"
puts open

puts "Select action:"
puts "1. Add new task."
puts "2. Mark task as completed."
puts "3. Show completed tasks."

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

elsif action.to_i == 3

  completed = list(done_f)
  puts "Completed tasks:", completed

end

open = list(started_f)
puts "Tasks to complete:", open