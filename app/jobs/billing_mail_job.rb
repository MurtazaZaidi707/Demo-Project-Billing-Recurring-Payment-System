class BillingMailJob < ApplicationJob
  queue_as :default

  def perform(subscription_ids)
    subscription_ids.each do |sub_id|
      subsc = Subscribe.find(sub_id)
      UserMailer.billing(subsc.user).deliver_now # if subsc.billing_date.day == Date.today.day
    end
  end
end
