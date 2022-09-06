require 'stripe'
Stripe.api_key = 'sk_test_51LdUqAFFetOm4qIsSiIuTrz6Fn0J1I91vlqO0io45TA0kXt2WS6OnQUIio2yY5YNwJi3c7E9la6wvx9rd8ET7P1T001wu9PPXg'

Stripe::Customer.create({
  description: 'My First Test Customer (created for API docs at https://www.stripe.com/docs/api)',
})
