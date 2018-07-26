# frozen_string_literal: true

require 'rails_helper'
require 'support/steps/login_steps'

describe 'user login process' do
  include LoginSteps

  let(:user) { create(:user, email: 'test@example.com', password: '123456') }

  before { user }

  it 'signs me in' do
    visit_login_page

    fill_in_email_and_password_then_click_log_in

    page_should_have_log_in_user_email
  end
end
