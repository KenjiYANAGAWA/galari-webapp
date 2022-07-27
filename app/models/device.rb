class Device < ApplicationRecord
    belongs_to :user
    has_many :my_exhibits
    has_many :exhibits, through: :my_exhibits
end