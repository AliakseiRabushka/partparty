class Brand < ApplicationRecord
  has_many :products
  has_one_attached :logo
end
