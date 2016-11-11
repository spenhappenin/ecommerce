class Product < ApplicationRecord
  belongs_to :department
  belongs_to :cart
end
