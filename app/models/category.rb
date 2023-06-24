class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :name, presence: true
  has_many :operations
end
