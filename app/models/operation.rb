class Operation < ApplicationRecord
  validates :amount, presence: true, numericality: { other_than: 0 }
  validates :description, presence: true
  validates :odate, presence: true
  belongs_to :category
end
