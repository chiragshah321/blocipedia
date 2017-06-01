 # Store the environment variables on the Rails.configuration object
Rails.configuration.stripe = {
  publishable_key: 'pk_test_XGznVCLWOWDQxvsa4UDKQlyg',
  secret_key: 'sk_test_je3dbmixQCwqUc6Iprq0Xzjn'
}
 
# Set our app-stored secret key with Stripe
Stripe.api_key = Rails.configuration.stripe[:secret_key]