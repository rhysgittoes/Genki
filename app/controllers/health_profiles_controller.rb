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
		if @health_profile.save
			redirect_to patient_health_profile_path(@patient.id, @health_profile.id), notice: "Your profile has been created."
		else
			redirect_to new_patient_health_profile, notice: "Create profile unsuccessful. Please try again."

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
		@appointments = @patient.appointments.select(:date,:diagnosis, :referrals, :notes)
	end
		

	def edit
		@patient = Patient.find(params[:patient_id])
		@health_profile = HealthProfile.find(params[:id])
		build_associations(@health_profile)
	end

	def update
		@health_profile = HealthProfile.find(params[:id])
		if @health_profile.update(health_profile_params)
			redirect_to patient_health_profile_path, notice: "Your profile has been updated."
		else
			redirect_to edit_patient_health_profile_path, notice: "Please try updating your profile again."
		end
	end
	
	private
	
	def health_profile_params
		params.require(:health_profile).permit(:weight, :height, :blood_type, :insurer)
	end
	
	def build_associations(appointment)
		appointment.allergies.build
		appointment.illnesses.build
		appointment.prescriptions.build
		appointment.immunizations.build
	end

end
 
