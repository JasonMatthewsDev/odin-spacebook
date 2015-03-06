class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def facebook
    
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      render :text => request.env["omniauth.auth"].to_yaml
    end
  end
end