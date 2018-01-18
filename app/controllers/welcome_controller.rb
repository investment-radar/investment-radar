# frozen_string_literal: true

class WelcomeController < ApplicationController
  # :nocov:
  def index
    logger.info 'Welcome page!'
    render :index
  end
  # :nocov:
end
