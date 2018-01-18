# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def append_info_to_payload(payload)
    super

    payload[:host] = request.host
    payload[:user_id] = current_user.id if current_user
  end
end
