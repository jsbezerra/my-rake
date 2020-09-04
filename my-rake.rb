TASKS = {}

def task(name, deps=[], &block)
  TASKS[name] = Task.new(name, deps, block)
end

load './Rakefile'

ARGV.each { |arg|
  TASKS[arg].invoke
}
