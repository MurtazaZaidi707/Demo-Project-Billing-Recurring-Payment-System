# frozen_string_literal: true

class BillingMailJob < ApplicationJob
  queue_as :default

  def perform(subscription_ids)
    subscription_ids.each do |sub_id|
      subsc = Subscribe.find(sub_id)

      subsc.invoices.each do |invo|
        next unless invo.billing_date.month == Date.today.month
        next unless invo.billing_date.day == Date.today.day
        next unless invo.status == 'unpaid'

        usage = invo.subscribe.usage
        invo.status = 'paid'
        invo.unit_consumed = usage.unit_consumed
        usage.unit_consumed = 0
        usage.save
        invo.save
        Invoice.create(user_id: invo.user_id, subscribe_id: invo.subscribe_id, billing_date: Date.today.next_month,
                       status: 'unpaid')
        UserMailer.billing(subsc.user).deliver_now
      end
    end
  end
end
