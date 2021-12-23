class Buyer < User
  #Associations
  has_many :buyer_products
  has_many :favorite_products, through: :buyer_products, source: :product
end
