class Exhibit < ApplicationRecord
    validates :title, presence: true
    has_many_attached :photos
end