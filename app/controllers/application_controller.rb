class ApplicationController < ActionController::Base
  include Clearance::Controller
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

private 

def after_sign_in_path_for(resource)
  sign_in_and_redirect @user
end

def after_sign_out_path_for(resource_or_scope)
  root_path  
end

def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
 end

end
