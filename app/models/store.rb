class Store < ApplicationRecord
  has_many :departments, dependent: :destroy
end
