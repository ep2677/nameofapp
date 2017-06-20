if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else 
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_T130vAwA1593n3J8vHR3qJXJ',
    secret_key: 'sk_test_zkshBd02OcPqINmmnQ36BCw9'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]