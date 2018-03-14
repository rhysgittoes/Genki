class AppointmentsController < ApplicationController
  
  before_action :set_users
    
  def new
      @appointment = Appointment.new
      @appointment.key = SecureRandom.hex(4).upcase
  end
  
  def create
    @appointment.assign_attributes(appointment_params)
    if @appointment.save
      respond_to do |format|
          format.html {
            if current_user.type == "Doctor"
              redirect_to doctor_path(@user)
            else
              redirect_to patient_path(@user)
            end
          }
          # format.json {
          #   :json => {
          #     :error_message => "Sorry, there was an error saving your form. Please try again.",
          #     :success => "Appointment #{@appointment.key} was successfully recorded."              
          #   }
          # }
      end 
    else
      respond_to do |format|
        format.html {}
        format.js {}
      end
    end
  end
  
  private
  
  def set_users
    if current_user.type == "Doctor"
      @user = Doctor.find(current_user.id)
    elsif current_user.type == "Patient"
      @user = Patient.find(current_user.id)
    end
  end
  
end
