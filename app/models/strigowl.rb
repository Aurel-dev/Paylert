class Paylert < ApplicationRecord
  belongs_to :user
  belongs_to :product
  monetize :bidding_price

  def bidding_price
    if bidding_price.nil?
      return nil
    else 
      return self.bidding_price/100
    end
  end
  
  def bidding_price=(price)
    self.bidding_price = price.to_f * 100
  end
end