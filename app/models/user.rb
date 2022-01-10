class User < ApplicationRecord

    
    validates :username, :email, uniqueness: true, presence: true
    validates :password, presence: true 

    has_secure_password
end
