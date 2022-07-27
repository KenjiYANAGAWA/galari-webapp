class Exhibit < ApplicationRecord
    validates :title, presence: true
end