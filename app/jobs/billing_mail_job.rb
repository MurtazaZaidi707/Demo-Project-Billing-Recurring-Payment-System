# frozen_string_literal: true

class BillingMailJob < ApplicationJob
  queue_as :default

  def perform(subscription_ids)
    subscription_ids.each do |sub_id|
      subsc = Subscribe.find(sub_id)

      next unless subsc.billing_date.day == Date.today.day

      subsc.invoices.each do |invo|
        next unless invo.status == 'unpaid'

        invo.status = 'paid'
        invo.save
        UserMailer.billing(subsc.user).deliver_now
      end
    end
  end
end
