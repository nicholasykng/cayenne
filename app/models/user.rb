class User < ApplicationRecord
    has_many :recipes
    has_many :comments
    has_many :ratings
    has_secure_password
    validates :name, presence: true
    validates :email, uniqueness: true
    validates :email, presence: true
    validates :password, presence: true
end
