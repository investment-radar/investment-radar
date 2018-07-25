# frozen_string_literal: true

require 'rails_helper'

describe 'user login process' do
  before do
    create(:user, email: 'test@example.com', password: "123456")
  end

  it 'signs me in' do
    visit new_user_session_path

    within('.login') do
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: '123456'

      click_button 'Log in'
    end

    expect(page).to have_content 'test@example.com'
  end
end
