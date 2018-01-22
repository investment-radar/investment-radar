# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_raven_context
  before_action :authenticate_user!

  def append_info_to_payload(payload)
    super

    payload[:host] = request.host
    payload[:user_id] = current_user.id if current_user
  end

  private

  # TODO: :reek:NilCheck
  def set_raven_context
    Raven.user_context(session_id: session[:session_id], user_id: current_user&.id) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
