# frozen_string_literal: true

require 'rails_helper'

describe 'Welcome Page' do
  it 'visit welcome' do
    visit root_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'

    # expect(page).to have_content 'Hello World'
    # expect(page).to have_content '2017-09-15'
  end
end
