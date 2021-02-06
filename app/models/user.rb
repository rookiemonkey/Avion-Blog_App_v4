class User < ApplicationRecord

    validates :first_name,
            presence: true,
            length: { within: 1..20 }

    validates :last_name,
            presence: true,
            length: { within: 1..20 }

    validates :username,
            presence: true,
            uniqueness: true,
            length: { within: 3..50 }

    validates :email,
            presence: true,
            uniqueness: true,
            length: { within: 5..50 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
            
end
