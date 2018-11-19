class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # Check the OmniAuth docs and each omniauth-facebook gem's README to know which information is being returned.
    @user = User.from_omniauth(request.env["omniauth.auth"])

    # https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
