class MyExhibit < ApplicationRecord
    belongs_to :exhibit
    belongs_to :user
    belongs_to :device
end