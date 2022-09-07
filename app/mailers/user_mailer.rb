# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def billing(user)
    @user = user
    mail(to: user.email, subject: 'Billing day today')
  end
end
