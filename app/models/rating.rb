class Rating < ApplicationRecord
    belongs_to :user
    belongs_to :recipe
    validates :score, :inclusion =>{in: [0..10]}
    validates :score, presence: true
end
