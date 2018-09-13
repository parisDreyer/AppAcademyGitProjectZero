class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url  = "http://localhost:3000/cats"
    mail(to: 'defaultemail@appacademy.io', subject: 'Welcome to My the 99Cats Site')
  end
end
