class BraintreeController < ApplicationController
  respond_to :json

  def generate_token
    render_response(true, { token: Braintree::ClientToken.generate })
  end

  def checkout
    render_response(false, { message: 'invalid params' }) unless params.key?(:payment_method_nonce)
    nonce = params[:payment_method_nonce]
    payment_result = Braintree::Transaction.sale(
        :amount => params[:amount],
        :payment_method_nonce => nonce
    )
    render_response(true, payment_result)
  end

end
