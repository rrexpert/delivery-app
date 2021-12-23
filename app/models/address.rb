class Address < ApplicationRecord
  # polymorphic association
  belongs_to :addressable, polymorphic: true
end
