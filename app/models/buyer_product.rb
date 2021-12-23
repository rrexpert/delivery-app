class BuyerProduct < ApplicationRecord
  #Associations
  belongs_to :buyer
  belongs_to :product
end
