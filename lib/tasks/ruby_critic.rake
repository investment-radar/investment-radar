require "rubycritic/rake_task"

RubyCritic::RakeTask.new do |task|
  # Glob pattern to match source files. Defaults to FileList['.'].
  task.paths   = FileList['{app,lib}/**/*.rb']

  # You can pass all the options here in that are shown by "rubycritic -h" except for
  # "-p / --path" since that is set separately. Defaults to ''.
  task.options = '--mode-ci --format html'

  # Defaults to false
  task.verbose = true
end
