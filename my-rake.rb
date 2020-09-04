TASKS = {}

class Task
  def initialize(name, deps, action)
    @name = name
    @deps = deps
    @action = action
  end

  def invoke
    # do not run same task twice
    return if @already_run
    # resolve dependencies
    @deps.each { |dep|
      TASKS[dep].invoke
    }
    # execute task
    execute
    # mark as executed
    @already_run = true
  end

  def execute
    @action.call
  end
end

def task(name, deps=[], &block)
  TASKS[name] = Task.new(name, deps, block)
end

load './Rakefile'

ARGV.each { |arg|
  TASKS[arg].invoke
}
