class User < ApplicationRecord
    has_secure_password
    has_many :scores
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true
end
