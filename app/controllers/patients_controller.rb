class PatientsController < ApplicationController
  
  before_action :set_patient, except: [:new, :create, :index]
  
  def index
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
  
  def edit
  end
  
  def update
    @patient.assign_attributes(patient_params)
    if @patient.save
        redirect_to patient_path
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
  
  private
  
  def patient_params
    params.require(:user).permit(:first_name, :last_name, :email, :gender, :birthday, :language, :city, :country, :admission_id, :password)
  end
  
  def set_patient
    @patient = Patient.find(params[:id]) # temporary until signed_in verification has been set
    
    ## Wait until signed_in? method has been set 
    # if signed_in? 
    #   @patient= Patient.find(params[:id])
    #   return @patient
    # end
  end
    
end
