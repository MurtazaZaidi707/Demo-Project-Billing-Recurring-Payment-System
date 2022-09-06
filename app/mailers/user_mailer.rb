class UserMailer < ApplicationMailer

  default from: 'notifications@example.com'

  def billing(user)
    byebug
    @user = user
    mail(to: 'murtaza4707@gmail.com', subject: 'Billing day today')
  end
end
