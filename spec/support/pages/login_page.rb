class LoginPage < SitePrism::Page
  # set_url new_user_session_path

  element :user_email, '[name="user[email]"]'
  element :user_password, '[name="user[password]"]'

  element :log_in_button, '[name="commit"]'
end
