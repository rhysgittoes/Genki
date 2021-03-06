class HealthProfilesController < ApplicationController
	before_action :require_login
	
	def index
	end

	def new
		@patient = Patient.find(params[:patient_id])
		@health_profile = HealthProfile.new
		build_associations(@health_profile)

			if HealthProfile.where(:patient_id => current_user.id).count == 0
				render "new"
			else
				flash[:notice] = "A health profile already exists. Click on Edit Health Profile to update your profile."
				redirect_to patient_health_profile_path(@patient, @patient.health_profile.id)
			end	
	end

	def create
		@patient = Patient.find(params[:patient_id])
		@health_profile = HealthProfile.new(health_profile_params)
		@health_profile.patient_id = current_user.id
		set_associations(@health_profile, @patient)
		
		if @health_profile.save
			notification = @patient.notifications.find_by(category: "new_patient")
			notification.received = true
			notification.save
			redirect_to patient_health_profile_path(@patient.id, @health_profile.id), notice: "Your profile has been created."
		else
			redirect_to new_patient_health_profile_path(@patient), notice: "Create profile unsuccessful. Please try again."

		end
	end

	def show
		@patient = Patient.find(params[:patient_id])
		@relation = Relation.find_by(patient_id: @patient, doctor_id: current_user)
		@appointment = Appointment.new
		build_associations(@appointment)
		@health_profile = HealthProfile.find_by(patient_id: @patient.id)
		@immunizations = @patient.immunizations.select(:name, :date, :expiration_date)
		@allergies = @patient.allergies.select(:name, :severity, :status)
		@prescriptions = @patient.prescriptions.select(:medicine, :dosage, :refills, :expiration_date)
		@illnesses = @patient.illnesses.where(chronic: true).select(:name, :status)
    # MAy need to remove :id from selected attributes
		@appointments = @patient.appointments.select(:id, :date,:diagnosis, :referrals, :notes)		

	end
		

	def edit
		@patient = Patient.find(params[:patient_id])
		@health_profile = HealthProfile.find(params[:id])
		build_associations(@health_profile)
	end

	def update
		@patient = Patient.find(params[:patient_id])
		@health_profile = HealthProfile.find(params[:id])
		set_associations(@health_profile, @patient)
		
		if @health_profile.update(health_profile_params)
			redirect_to patient_health_profile_path, notice: "Your profile has been updated."
		else
			redirect_to edit_patient_health_profile_path, notice: "Please try updating your profile again."
		end
	end
	
	private
	
	def health_profile_params
		# params.require(:health_profile).permit(:weight, :height, :blood_type, :insurer)
		@patient = Patient.find(params[:patient_id])
		params.require(:health_profile).permit(
			:weight, :height, :blood_type, :insurer,
				immunizations_attributes: [:name, :expiration_date, :id, :_destroy, :notes],
				illnesses_attributes: [:name, :status, :id, :_destroy, :chronic, :notes],
				allergies_attributes: [:name, :status, :severity, :id, :_destroy, :notes],
				prescriptions_attributes: [:medicine, :dosage, :refills, :expiration_date, :id, :_destroy, :notes]
			).merge(patient: @patient)
	end
	
	def build_associations(appointment)
		appointment.allergies.build
		appointment.illnesses.build
		appointment.prescriptions.build
		appointment.immunizations.build
	end
	
	def build_associations(health_profile)
		health_profile.allergies.build
		health_profile.illnesses.build
		health_profile.prescriptions.build
		health_profile.immunizations.build
	end
	
	def set_associations(health_profile, patient)
		
	    health_profile.illnesses.each do |illness|
	      illness.patient = patient
	    end
	    
	    health_profile.allergies.each do |allergy|
	      allergy.patient = patient
	    end
	    
	    health_profile.immunizations.each do |immunization|
	      immunization.patient = patient
	    end
	    
	    health_profile.prescriptions.each do |prescription|
	      prescription.patient = patient
	      prescription.doctor = current_user if current_user.type == "Doctor"

	    end
	end

end
 
