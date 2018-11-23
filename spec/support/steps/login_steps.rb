# frozen_string_literal: true

module LoginSteps
  def visit_login_page
    visit new_user_session_path
  end

  def fill_in_email_and_password_then_click_log_in
    login_page = LoginPage.new
    login_page.user_email.set user.email
    login_page.user_password.set '123456'
    login_page.log_in_button.click
  end

  def page_should_have_log_in_user_email
    welcome_page = WelcomePage.new
    expect(welcome_page).to have_content user.email
  end
end
