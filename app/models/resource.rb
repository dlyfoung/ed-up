class Resource < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :rating, numericality: true
end
