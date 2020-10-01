class Shop < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy

  SHOPS = ["Amazon", "Boulanger", "Decathlon", "Leroy Merlin" ]
end