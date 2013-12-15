# a simple collection of functions to work with the tasks file - CRUD

# return an array of open tasks
def index(file)  

  file = File.open(file, "r")
  tasks = file.readlines
  file.close

  return tasks

end

def show(file)
  
  tasks = index(file)

  # generate a counted output of open tasks
  tasks.each do |task|
    tasks[tasks.index(task)] = "#{tasks.index(task) + 1}. #{task}"
  end

  return tasks

end

# saves a task to open tasks
def create(file, task, mode)

  file = File.open(file, mode)
  #file.write(task)
  file.puts(task)
  file.close

end

def complete(source, target, task)
  
  tasks = index(source)
  
  # delete completed task from task array and write the new array to open tasks file
  tasks.delete_at(task-1)
  create(source, tasks, "w+")
  
  # append completed task to completed tasks file
  completed = tasks[task-1]
  create(target, completed, "a+")

end