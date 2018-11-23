# frozen_string_literal: true

require 'rails_helper'
require 'support/steps/login_steps'

describe 'Welcome Page' do
  include LoginSteps

  let(:user) { create(:user, email: 'test@example.com', password: '123456') }

  before { user }

  it 'visit welcome' do
    welcome_page = WelcomePage.new
    welcome_page.load

    expect(welcome_page.alert).to have_content 'You need to sign in or sign up before continuing.'

    fill_in_email_and_password_then_click_log_in

    expect(welcome_page).to have_content 'Signed in successfully.'
    expect(welcome_page).to have_content 'Current User: test@example.com'
  end
end
