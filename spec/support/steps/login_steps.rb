module LoginSteps
  def visit_login_page
    visit new_user_session_path
  end

  def fill_in_email_and_password_then_click_log_in
    within('.login') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: '123456'

      click_button 'Log in'
    end
  end

  def page_should_have_log_in_user_email
    expect(page).to have_content user.email
  end
end
