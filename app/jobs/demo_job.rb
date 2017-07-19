class DemoJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    logger.info "I will start to sleep:"
    logger.info "#{args}"
    sleep(20)
    logger.info "I wake up now!"
  end
end
