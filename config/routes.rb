Rails.application.routes.draw do

  get 'token' => 'braintree#generate_token'
  post 'checkout/:amount' => 'braintree_checkout'
end
