TASKS = {}

class Task
  def initialize(name, deps, action)
    @name = name
    @deps = deps
    @action = action
  end

  def invoke

  end
end

def task(name, deps=[], &block)
  TASKS[name] = Task.new(name, deps, block)
end

load './Rakefile'

ARGV.each { |arg|
  TASKS[arg].invoke
}
