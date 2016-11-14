class Store < ApplicationRecord
  has_many :departments, dependent: :destroy

  validates :name, :owner, :location, :color, presence: true
  validates :name, uniqueness: true
  validates :color, inclusion: { in: %w(blue red green orange yellow purple pink),
  	message: 'Invalid Color!'}
end
