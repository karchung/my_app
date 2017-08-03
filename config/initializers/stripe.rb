if Rails.env.production? 
  Rails.configuration.stripe = { 
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'], 
    secret_key: ENV['STRIPE_SECRET_KEY'] 
  } 
else 
  Rails.configuration.stripe = { 
    publishable_key: 'pk_test_LZ8koDewSVS1J3d87bFYM8CI', 
    secret_key: 'sk_test_g4Lxuw9Xf3gtYFx5eUh7nG3g' 
  } 
end 
 
Stripe.api_key = Rails.configuration.stripe[:secret_key]