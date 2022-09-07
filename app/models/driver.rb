class Driver < ApplicationRecord
    belongs_to :organization
    has_many :routes
end
