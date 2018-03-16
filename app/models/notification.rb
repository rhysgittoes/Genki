class Notification < ApplicationRecord
  
  belongs_to :user
  enum user_type: [:patient, :doctor]
  enum category: [:appointment, :prescription]
  
  
  def self.create_appointment_notifications(appointment, health_profile)
    notification = Notification.new
    notification.text = "Your appointment on #{appointment.created_at.to_date} has been added to your visit logs."
    notification.link = "patients/#{appointment.patient.id}/health_profiles/#{health_profile.id}"
    notification.category = 0
    
    notification.create_patient_appointment_notification(appointment)
    notification.create_doctor_appointment_notification(appointment)
  end
  
  # Appointment Notifications
  
  def create_patient_appointment_notification(appointment)
    self.user = appointment.patient
    self.user_type = 0
    self.save
  end
  
  def create_doctor_appointment_notification(appointment)
    self.user = appointment.doctor
    self.user_type = 1
    self.save
  end
  
  # Prescription Notifications
  
  def self.create_new_prescription_notifications(prescription)
    notification = Notification.new
    notification.category = 1

    notification.create_patient_new_prescription_notification(prescription)    
    notification.create_doctor_new_prescription_notification(prescription)    
  end
  
  def create_patient_new_prescription_notification(prescription)
    @doctor = Doctor.find(prescription.doctor_id)
    self.user = prescription.patient
    self.text = "You received a new prescription from Dr. #{@doctor.first_name + " " + @doctor.last_name}."
    self.link = "/patients"
    self.user_type = 0
    self.save
    
  end
  
  def create_doctor_new_prescription_notification(prescription)
    @patient = Patient.find(prescription.patient_id)
    self.user = prescription.doctor
    self.text = "Your prescription for #{@patient.first_name + " " + @patient.last_name} has been received."
    self.link = "/doctors"
    self.user_type = 1
    self.save
  end
  
end