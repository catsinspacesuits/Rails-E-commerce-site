if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_RAU9AQmmu7QjeX6jLc10uATU',
    secret_key: 'sk_test_kOVFlnpBTzLsFyaSMqhGc4Tv'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]