class App 
    attr_accessor :tasks
    def initialize 
        @tasks = []
    end

    def add_task(task_input)
    @tasks << { task: task_input, completed: false }
    end

    def display_add_task
        puts 'Enter the task name'
    end
    def task_add
        gets.strip
    end
    def display_tasks
        puts "Tasks:"
        @tasks.each_with_index do |task,index|
        puts "#{index + 1}. #{task[:task]} [ ]"
        end
    end
end     