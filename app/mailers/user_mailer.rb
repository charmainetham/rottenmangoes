class UserMailer < ActionMailer::Base
  default from: "notifications@example.com"

  def goodbye_email(user)
    @user = user
    @url = 'http://localhost:3000'
    mail(to: @user.email, subject: '@user.full_name, your account has been deleted')
  end
end

