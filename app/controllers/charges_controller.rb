class ChargesController < ApplicationController
  def create
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: params[:amount],
      description: 'Rails Stripe customer',
      currency: 'usd'
    )

    order_is_paid = Order.find(params[:orderId]).update(status: 1)
    Purchase.create(email: params[:emailUser],
                    card: params[:stripeToken],
                    amount: params[:amount], description: charge.description,
                    currency: charge.currency,
                    customer_id: customer.id,
                    order_id: params[:orderId],
                    user_id: current_user.id
                  )
    redirect_to order_path(params[:orderId])
    # rescue jika not connected
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end
end
