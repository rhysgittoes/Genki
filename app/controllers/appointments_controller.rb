class AppointmentsController < ApplicationController
  
  before_action :set_users
    
  def new
  end
  
  def create
    # Set users 
    @patient = Patient.find(params[:patient_id])

    # Set user health_profile
    @health_profile = HealthProfile.find(params[:id])
    @appointment = current_user.appointments.new(appointment_params)
    @appointment.key = SecureRandom.hex(4).upcase
    @appointment.date = Date.today
    
    set_associations(@appointment, @patient)

    if @appointment.save
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
      immunizations_attributes: [:name],
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
  
  def set_users
    if current_user.type == "Doctor"
      @user = Doctor.find(current_user.id)
    elsif current_user.type == "Patient"
      @user = Patient.find(current_user.id)
    end
  end
  
end





    # # Create new Prescription
    # if !params[:prescription].empty?
    # @prescription = Prescription.new(prescription_params)
    # @prescription.patient_id = @patient.id
    #   # if @prescription.save
    #   #   flash[:notice] = "Success"
    #   # else
    #   #   redirect_to patient_health_profile_path(@patient, @health_profile)
    #   # end
    # end
    
    # # Create new allergy
    # if !params[:allergy].empty?
    #   @allergy = Allergy.new(allergy_params)
    #   @allergy.patient_id = @patient.id
    #   # if @prescription.save
    #   #   flash[:notice] = "Success"
    #   # else
    #   #   redirect_to patient_health_profile_path(@patient, @health_profile)
    #   # end
    # end
    
    # # Create new illness
    # if !params[:illness].empty?
    #   @illness = Illness.new(illness_params)
    #   @illness.patient_id = @patient.id
    #   # if @prescription.save
    #   #   flash[:notice] = "Success"
    #   # else
    #   #   redirect_to patient_health_profile_path(@patient, @health_profile)
    #   # end
    # end
    
    
    
    
    
  #   def prescription_params
  #   params.require(:prescription).permit(:medicine, :dosage, :refills, :expiration_date)
  # end
  
  # def allergy_params
  #   params.require(:allergy).permit(:name, :status, :severity)
  # end
  
  # def illness_params
  #   params.require(:illness).permit(:name, :status)
  # end