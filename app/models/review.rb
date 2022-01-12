class Review < ApplicationRecord
    belongs_to :user
    belongs_to :book
    validates :rating, :content, :book, presence: true
    #validates :book, uniqueness: {scope: :user_id, message: "may only have one review per user, please just edit your existing one."}
  
  end