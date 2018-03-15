class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception


private 

def after_sign_in_path_for(resource)
  sign_in_and_redirect @user
end

end
