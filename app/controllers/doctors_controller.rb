class DoctorsController < ApplicationController
 
   before_action :require_login, except: [:new, :create]

def index
  @user = current_user
  @doctor = current_user
  # @appointments = Appointment.where(doctor_id: current_user.id)
  @appointments = current_user.appointments
end

def new
  @doctor = Doctor.new  
end

def create
  @doctor = Doctor.new(doctor_params)
  @doctor.admission_id = SecureRandom.hex(4).upcase
  if @doctor.save
    flash[:notice] = "Welcome, DR.#{@doctor.first_name}!"
    sign_in @doctor
    redirect_to doctors_path
  else
    flash[:notice] = "Sorry, there was an error creating your account. Please try again."
    render :new
  end
end

def show
  @doctor = Doctor.find_by_id(params[:id])
end

def edit
  @doctor = Doctor.find_by_id(params[:id])
end

def update
  @doctor = Doctor.find(params[:id])
  if @doctor.update(doctor_params)
  redirect_to doctors_path
  else 
  flash[:notice] = "Please input valid information"
  render "edit" 
  end
end

def search
  @result = User.search(params[:search])
  #@result.each do |result|
    #@health_profile = HealthProfile.find_by(patient_id: result.id)
  #end
end


private
  
def doctor_params
  params.require(:doctor).permit(:first_name, :last_name, :email, :gender, :birthday, :language, :city, :country, :admission_id, :certification, :experience, :password, :avatar)  
end

end
