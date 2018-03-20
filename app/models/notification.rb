class Notification < ApplicationRecord
  
  belongs_to :user
  enum user_type: [:patient, :doctor]
  enum category: [:appointment, :prescription, :new_patient, :new_doctor, :expired_immunization, :expired_prescription]
  
  
  def self.create_appointment_notifications(appointment, health_profile)
    p_notification = Notification.new
    d_notification = Notification.new

    p_notification.create_patient_appointment_notification(appointment)
    d_notification.create_doctor_appointment_notification(appointment)
  end
  
  # Appointment Notifications
  
  def create_patient_appointment_notification(appointment)
    self.text = "Your appointment on #{appointment.created_at.to_date} has been added to your visit logs."
    self.link = "patients/#{appointment.patient.id}/health_profiles/#{appointment.patient.health_profile.id}"
    self.category = 0
    self.user = appointment.patient
    self.received = false
    self.user_type = 0
    self.save
  end
  
  def create_doctor_appointment_notification(appointment)
    self.text = "Your appointment on #{appointment.created_at.to_date} has been added to your visit logs."
    self.link = "patients/#{appointment.patient.id}/health_profiles/#{appointment.patient.health_profile.id}"
    self.category = 0
    self.user = appointment.doctor
    self.received = false
    self.user_type = 1
    self.save
  end
  
  # Prescription Notifications
  
  def self.create_new_prescription_notifications(prescription)
    p_notification = Notification.new
    p_notification.category = 1
    p_notification.create_patient_new_prescription_notification(prescription)
    
    d_notification = Notification.new
    d_notification.category = 1
    d_notification.create_doctor_new_prescription_notification(prescription)    
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
  
  def self.check_for_expiring_prescriptions(patient)
    patient.prescriptions.each do |prescription|
      if prescription.expiration_date != nil && prescription.expiration_date < Date.today + 1.month
        self.create_new_expiring_prescription_notice(prescription)
      end
    end
  end
  
  def self.create_new_expiring_prescription_notice(prescription)
    notification = Notification.new
    notification.user = prescription.patient
    notification.text = "Your prescription for #{prescription.medicine} will expire on #{prescription.expiration_date}. Contact #{prescription.doctor ? "Dr." + prescription.doctor.last_name : "your doctor" } for a refill."
    notification.link = "patients/#{prescription.patient.id}/health_profiles/#{prescription.patient.health_profile.id}"
    notification.user_type = 0
    notification.category = 5
    notification.save
  end
  
  # Patient notifications
  
  def self.new_patient_notification(patient)
    notification = Notification.new
    notification.user = patient
    notification.text = "Welcome to Genki, #{patient.first_name}! To get started on the platform and become accessible to your doctors, please create your health profile."
    notification.link = "patients/#{patient.id}/health_profiles/new"
    notification.user_type = 0
    notification.category = 2
    notification.save
  end
  
  # Doctor notifications
  
  def self.new_doctor_notification(doctor)
    notification = Notification.new
    notification.user = doctor
    notification.text = "Welcome to Genki, #{doctor.first_name}! To get started on the platform, please update your personal and professional details."
    notification.link = "doctors/#{doctor.id}/edit"
    notification.user_type = 0
    notification.category = 3
    notification.save
  end
  
  # Immunization upcoming
  
  def self.check_for_expiring_immunizations(patient)
    patient.immunizations.each do |immunization|
      if immunization.expiration_date != nil && immunization.expiration_date < Date.today + 1.month 
        self.create_new_immunization_notice(immunization)
      end
    end
  end
  
  def self.create_new_immunization_notice(immunization)
    notification = Notification.new
    notification.user = immunization.patient
    notification.text = "You're due for another round of the #{immunization.name} vaccine. This immunization will no longer be effective as of #{immunization.expiration_date}."
    notification.link = "patients/#{immunization.patient.id}/health_profiles/#{immunization.patient.health_profile.id}"
    notification.user_type = 0
    notification.category = 4
    notification.save
  end

end