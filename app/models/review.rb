class Review < ApplicationRecord
    belongs_to :user
    belongs_to :book
    validates :rating, numericality: {greater_than: 0, less_than_or_equal_to: 10}
    validates :content, length: {minimum: 2}
    validates :content, presence: true

  
  end