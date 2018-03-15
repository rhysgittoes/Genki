class AppointmentsController < ApplicationController
  
  before_action :set_information
  before_action :verify_user_type, only: [:create]
    
  def new
  end
  
  def create
    @appointment = current_user.appointments.new(appointment_params)
    @appointment.key = SecureRandom.hex(4).upcase
    @appointment.date = Date.today
    
    set_associations(@appointment, @patient)
    
    if @appointment.save
      Notification.create_appointment_notifications(@appointment, @health_profile)
      flash[:notice] = "Your appointment has been saved."
      redirect_to patient_health_profile_path(@patient, @health_profile)
    else
      flash[:notice] = "There was a problem saving your appointment, please try again."
      redirect_to patient_health_profile_path(@patient, @health_profile)
    end 
    

    
  end
  
  private
  
  def appointment_params
    symptoms = params[:appointment][:symptoms].split(",")
    @patient = Patient.find(params[:patient_id])
    params.require(:appointment).permit(
      :diagnosis, :referrals, :notes, :symptoms,
      immunizations_attributes: [:name, :expiration_date],
      illnesses_attributes: [:name, :status],
      allergies_attributes: [:name, :status, :severity],
      prescriptions_attributes: [:medicine, :dosage, :refills, :expiration_date]
      ).merge(symptoms: symptoms,
      patient: @patient
      )
  end
  
  def set_associations(appointment, patient)
    appointment.illnesses.each do |illness|
      illness.patient = patient
    end
    
    appointment.allergies.each do |allergy|
      allergy.patient = patient
    end
    
    appointment.immunizations.each do |immunization|
      immunization.patient = patient
    end
    
    appointment.prescriptions.each do |prescription|
      prescription.patient = patient
      prescription.doctor = current_user
    end
  end
  
  def set_information
    @patient = Patient.find(params[:patient_id])
    @health_profile = HealthProfile.find(params[:id])
  end
  
  def verify_user_type
    if current_user.type != "Doctor"
      flash[:notice] = "Oops, you don't have permission for that. Is this where you meant to go?"
			redirect_to new_patient_health_profile_path(current_user, @health_profile)
    end
  end
  
end
