class BillingMailJob < ApplicationJob
  queue_as :default

  def perform(subscribe)
    subscribe.each do |date|
      if date.billing_date.day == Date.today.day
        UserMailer.billing(date.user).deliver_now
      end
    end
  end
end
