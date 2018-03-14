Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = "reply@example.com"
  if Session.type == doctor 
  config.redirect_url = "/doctors"
  else 
    config.redirect_url = "/patients"
  end
end