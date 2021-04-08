class ApplicationController < ActionController::Base
  before_action :basic_auch
  before_action :configure_permitted_parameters, if: :devise_controller?





  private 
  def basic_auch
    authenticate_or_request_with_http_basic do |username, password|
      username == 'fujiwara' && password == '0630'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday, :first_name, :last_name, :first_name_kana, :last_name_kana])
  end

  
end
