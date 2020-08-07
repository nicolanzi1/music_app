class ApplicationMailer < ActionMailer::Base
  default from: 'musicapp@example.com'
  layout 'mailer'

  def activation_email(user)
    @user = user
    mail(to: user.email, subject: "Welcome to your MusicApp! Please clikc on the link to activate your account!.")
  end
end
