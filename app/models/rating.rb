class Rating < ApplicationRecord
    belongs_to :user
    belongs_to :recipe
    validates :score, numericality: '{ less_than_or_equal_to :10 }'
    validates :score, presence: true
end
