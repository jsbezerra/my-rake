TASKS = {}

ARGV.each { |arg|
  TASKS[arg].invoke
}
