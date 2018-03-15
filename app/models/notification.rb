class Notification < ApplicationRecord
  
  belongs_to :user
  enum user_type: [:patient, :doctor]
  enum category: [:appointment, :prescription]
  
  def self.create_appointment_notifications(appointment, health_profile)
    create_patient_appointment_notification(appointment, health_profile)
    create_doctor_notification(appointment)
  end
  
  def self.create_patient_appointment_notification(appointment, health_profile)
    notification = Notification.new
    notification.user = appointment.patient
    notification.text = "Your appointment on #{appointment.created_at.to_date} has been added to your visit logs."
    notification.category = 0
    notification.user_type = 0
    notification.link = "patients/#{appointment.patient.id}/health_profiles/#{health_profile.id}"
    notification.save
  end
  
end