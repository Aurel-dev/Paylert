class Product < ApplicationRecord
  belongs_to :shop
  has_many :strigowls, dependent: :destroy
  CATEGORIES = ["Electro-ménager","Electronique", "Jardin", "Loisirs", "Textiles" ]
  BRANDS = ["Acer", "Apple", "Asus", "Bosch", "Black & Decker", "Converse", "Inesis", "Jura", "Lenovo", "Nike", "Pfeiffer.inc", "Toshiba", "Willi Waller", "Wilson"]

  after_update_commit  :check_price_strigowls

  def price_euros
    self.price/100
  end

  def price_euros=(price)
    self.price = price.to_f*100
  end
  private

  def check_price_strigowls
    strigowl = Strigowl.where(product_id: self.id, status: "En attente d'execution").where("bidding_price >= ?", self.price).first
    if strigowl
      user = strigowl.user
      if (user.stripe_customer_id && user.credit_card_id)
        intent = Stripe::PaymentIntent.create({
        amount: strigowl.product.price,
        currency: 'eur',
        customer: user.stripe_customer_id,
        payment_method: user.credit_card_id,
        off_session: true,
        confirm: true,
      })
      end
      strigowl.status = "Executée !"
      strigowl.save
      UserMailer.with(strigowl:strigowl, user: strigowl.user).execution.deliver_now
    end
  end
end