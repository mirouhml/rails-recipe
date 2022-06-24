class InventoryFood < ApplicationRecord
  belongs_to :inventory
  belongs_to :food

  validates :inventory, presence: true
  validates :food, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
