class ProfilesController < ApplicationController

    def index
      @strigowls = Strigowl.all
    end
  
    def show
      @strigowls = Strigowl.where(user_id: current_user.id)
      @strigowls_pending = Strigowl.where(status: "En attente d'execution", user: current_user)
      @strigowls_executed = Strigowl.where(status: "Executée !", user: current_user)
    end
  
    def new
      @strigowl = Strigowl.new
    end
  
    def add_credit_card
      current_user.create_stripe_customer_id!
      payment_intent = Stripe::PaymentIntent.create({
          amount: 1099,
          currency: 'usd',
          customer: current_user.stripe_customer_id,
      })
      @client_secret = payment_intent["client_secret"]
    end
  end