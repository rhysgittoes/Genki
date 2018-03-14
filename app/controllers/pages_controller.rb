class PagesController < ApplicationController
  def index
   @user = current_user
   if @user.type == "Doctor" 
    redirect_to doctors_path
  else
    redirect_to patients_path
  end
  end
end