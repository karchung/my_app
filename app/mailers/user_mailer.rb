class UserMailer < ApplicationMailer 
  default from: "donotreply@kellyinc.com" 
 
  def contact_form(email, name, message) 
    @message = message 
      mail(from: email, 
        to: 'kelly_archung@yahoo.com', 
        subject: "A new contact form message from #{name}") 
  end 
  
  def registration_confirmation(email, name) 
    @name = name
      mail(from: 'donotreply@kellyinc.com', 
        to: email, 
        subject: "Registration Confirmation") 
  end
end