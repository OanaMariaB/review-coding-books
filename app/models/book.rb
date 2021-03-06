class Book < ApplicationRecord
    has_many :reviews 
    has_many :users, through: :reviews
    validates :title, uniqueness: true, presence: true
    validates :author, presence: true

    scope :alpha, -> {order('title')}

end