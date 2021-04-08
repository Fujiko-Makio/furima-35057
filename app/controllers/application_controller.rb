class ApplicationController < ActionController::Base
  before_action :basic_auch





  private 
  def basic_auch
    authenticate_or_request_with_http_basic do |username, password|
      username == 'fujiwara' && password == '0630'
    end
  end

end
