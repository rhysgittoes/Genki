class PatientsController < ApplicationController
  
  before_action :set_patient, except: [:new, :create]
  before_action :verify_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @patient = current_user
    @health_profile = HealthProfile.find_by(patient_id: @patient.id)
    @relation = Relation.where(patient_id: current_user.id)

  end
  
  def new
    @patient = Patient.new
  end
  
  def create
    @patient = Patient.new(patient_params)
    @patient.admission_id = SecureRandom.hex(4).upcase
    if @patient.save
      flash[:notice] = "Welcome, #{@patient.first_name}!"
      sign_in @patient
      redirect_to patients_path
    else
      flash[:notice] = "Sorry, there was an error registering you. Try again."
      render :new
    end
  end

  def show
    @patient = Patient.find_by_id(params[:id])
  end
  
  def edit
    @patient = Patient.find_by_id(params[:id])
  end
  
  def update
    @patient.assign_attributes(patient_params)
    if @patient.save
        redirect_to patients_path
    else
        flash[:notice] = "Sorry, there was an error updating your information. Please try again."
        redirect_to edit_patient_path
    end
  end
  
  def destroy
    @patient.destroy
    if @patient.save
      flash[:notice] = "You have successfully deleted your account."
      redirect_to welcome_path # not created yet
    else
      flash[:notice]= "Sorry, there was an error deleting your account. Please try again."
      redirect_to welcome_path # not created yet
    end
  end

  def search
    @result = Doctor.search(params[:search])
  end
  
  private
  
  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :email, :gender, :birthday, :language, :city, :country, :admission_id, :password, :avatar)
  end
  
  def set_patient
    if signed_in?
      if current_user.type == "Patient"
        @patient = current_user
      else
       redirect_to doctors_path
      end
    else
      redirect_to root_url
    end
  end
  
  def verify_user
    if params[:id].to_i != @patient.id
      redirect_to patients_path
    end
  end
    
end
