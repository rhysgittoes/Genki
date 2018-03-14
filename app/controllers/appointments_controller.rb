class AppointmentsController < ApplicationController
  
  before_action :set_users
    
  def new
  end
  
  def create
    @patient = Patient.find(params[:patient_id])
    @health_profile = HealthProfile.find(params[:id])
    @doctor = current_user
    
    @appointment = Appointment.new(appointment_params)
    @appointment.key = SecureRandom.hex(4).upcase
    @appointment.patient_id = @patient.id
    @appointment.doctor_id = @doctor.id
    @appointment.date = Date.today
    
    if @appointment.save
      flash[:notice] = "Your appointment has been saved."
      redirect_to patient_health_profile_path(@patient.id, @health_profile.id)
    else
      flash[:notice] = "There was a problem saving your appointment, please try again."
      redirect_to patient_health_profile_path(@patient.id, @health_profile.id)
    end 
  end
  
  private
  
  def appointment_params
    symptoms = params[:appointment][:symptoms].split(",")
    params.require(:appointment).permit(:diagnosis, :referrals, :notes).merge(symptoms: symptoms)
  end
  
  def set_users
    if current_user.type == "Doctor"
      @user = Doctor.find(current_user.id)
    elsif current_user.type == "Patient"
      @user = Patient.find(current_user.id)
    end
  end
  
end
