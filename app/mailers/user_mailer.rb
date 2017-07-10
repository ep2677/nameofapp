class UserMailer < ApplicationMailer
  default from: "from@example.com"

    def contact_form(email, name, message)
    @message = message
    @name = name
      mail(:from => email,
          :to => 'epwalsh77@gmail.com',
          :subject => "A new contact form message from #{name}")
    end
    def welcome(user)
      @user = user
        mail(:from => 'epwalsh77@gmail.com',
            :to => @user.email,
            :subject => "Welcome to Bike Berlin!")
    end
end
