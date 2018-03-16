class HealthProfilesController < ApplicationController
	before_action :require_login
	
	def index
		@patient = Patient.find(params[:patient_id])
		@relation = Relation.all
		@health_profile = HealthProfile.all
	end

	def new
		@patient = Patient.find(params[:patient_id])
		@health_profile = HealthProfile.new
			if HealthProfile.where(:patient_id => current_user.id).count == 0
				render "new"
			else
				redirect_to patient_health_profile_path(@patient, @patient.health_profile.id), notice: "A health profile already exists."
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
		@appointment = Appointment.new
		@appointment.allergies.build
		@appointment.illnesses.build
		@appointment.prescriptions.build
		@appointment.immunizations.build
		@patient = Patient.find(params[:patient_id])
		@health_profile = HealthProfile.find(params[:id])
	end
		

	def edit
		@patient = Patient.find(params[:patient_id])
		@health_profile = HealthProfile.find(params[:id])
		
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

end
 
