class User < ApplicationRecord
  #Use polymorphic address
  has_one :address, as: :addressable
  has_many :favorite_products

  has_secure_password

  #methods
  def supplier?
    type.eql?('Supplier')
  end

  def buyer?
    type.eql?('Buyer')
  end
end
