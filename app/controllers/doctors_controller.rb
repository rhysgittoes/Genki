class DoctorsController < ApplicationController
  
  before_action :set_doctor, only: [:edit, :show, :update]

  before_action :require_login, except: [:new, :create]

def index
end

def new
  @doctor = Doctor.new  
end

def create
  @doctor = Doctor.new(doctor_params)
  @doctor.admission_id = SecureRandom.hex(8)
  if @doctor.save
    redirect_to doctors_path
    
  else
    flash[:notice] = "Sorry, there was an error creating your account. Please try again."
    redirect_to new_doctor_path
  end
end

def show
  @doctor = Doctor.find(params[:id])
end

def edit
end

def update
  @doctor = Doctor.find(params[:id])
  if @doctor.update(doctor_params)
  redirect_to doctor_path
  else
  flash[:notice] = "Please input valid information"
  render "edit" 
end

def new_visit
  @doctor = current_user.patients.find(params[:id])
  @appointment = Appointment.new(appointment_params)
end

def search
  @patients = Patient.where("first_name ILIKE ? OR last_name ILIKE ?", params[:search], params[:search])

end


private

def set_doctor
  @doctor = Doctor.find(params[:id])
end
  
def doctor_params
  params.require(:doctor).permit(:first_name, :last_name, :email, :gender, :birthday, :language, :city, :country, :admission_id, :certification, :experience)  
end

def appointment_params
  params.require(:appointment).permit(:date, :symptoms, :diagnosis, :referrals, :notes, :doctor_id, :patient_id)
end


end
