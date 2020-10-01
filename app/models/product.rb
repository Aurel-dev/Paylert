class Product < ApplicationRecord
  belongs_to :shop
  has_many :strigowls, dependent: :destroy
end