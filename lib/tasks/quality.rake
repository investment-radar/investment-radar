# frozen_string_literal: true

if Rails.env.development? || Rails.env.test?
  namespace :quality do
    require 'rubocop/rake_task'
    RuboCop::RakeTask.new do |task|
      task.requires << 'rubocop-rspec'
    end

    require 'reek/rake/task'
    Reek::Rake::Task.new do |task|
      task.source_files = FileList['{app,lib}/**/*.rb']
    end
  end

  desc 'Run all code quality checks'
  task quality: %w[quality:rubocop quality:reek]

  # task default: %w[:quality]
end

task default: %w[quality:rubocop quality:reek]
