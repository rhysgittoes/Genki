class PagesController < ApplicationController
  def index
   @user = current_user
   if @user == nil 
    render "/pages/index"
  elsif @user.type == "Patient"
    redirect_to patients_path
  else @user.type == "Doctor"
    redirect_to doctors_path
  end
  end
end