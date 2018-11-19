# frozen_string_literal: true

require 'rails_helper'

describe 'Welcome Page' do
  it 'visit welcome' do
    welcome = WelcomePage.new
    welcome.load

    expect(welcome.alert).to have_content 'You need to sign in or sign up before continuing.'
  end
end
