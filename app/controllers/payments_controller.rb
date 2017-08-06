class PaymentsController < ApplicationController
  def create 
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken] 
    # Create the charge on Stripe's servers - this will charge the user's card 
    begin 
      charge = Stripe::Charge.create( 
        amount: @product.price, # amount in cents, again 
        currency: "usd", 
        source: token, 
        description: params[:stripeEmail],
        receipt_email: @user.email,
      ) 
      if charge.paid 
        Order.create(
          :user_id      => @user.id,
          :product_id   => @product.id,
          :user_email   => @user.email,
          :total        => @product.price
        ) 
      end
    rescue Stripe::CardError => e 
      # The card has been declined 
    end 
    expect(response).to redirect_to(product_path(@product))
  end
end