started_file = "started.txt"
done_file = "done.txt"

def read_tasks(file)  
  tasksfile = File.open(file, "r")
  tasks = tasksfile.readlines
  tasksfile.close

  return tasks
end

def puts_tasks(tasks)
  i = 1

  for task in tasks
    puts "#{i}. #{task}"
    i += 1
  end

end

def create_task(file, task)
  target = File.open(file, "a")
  target.write(task)
  target.close
end

# marks task as complete - deletes it from the source file and add it to done file
def mark_task(source, target, task)
  tasks = read_tasks(source)
  completed_task = tasks[task-1]

  tasks.delete_at(task-1)
  file = File.open(source, "w")
  file.puts tasks
  file.close
  
  file = File.open(target, "a")
  file.puts completed_task
  file.close
end

puts "Todo:"
tasks = read_tasks(started_file)
puts_tasks(tasks)

puts "Select action:"
puts "1. Add a new task."
puts "2. Mark a task as completed."

action = gets.chomp

if action.to_i == 1
  puts "New task:"
  task = gets.chomp

  create_task(started_file, task)

  puts "You have successfully added \"#{task}\" to your to-do list.\nTodo:"
  tasks = read_tasks(started_file)
elsif action.to_i == 2
  puts "Which task?"
  task = gets.chomp.to_i

  mark_task(started_file, done_file, task)
end

