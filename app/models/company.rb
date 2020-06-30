class Company < ApplicationRecord
    has_many :offices
    has_many :employees
    has_many :buildings, through: :offices
    validates :name, presence: true
    validates :name, length: { minimum: 5 }

    def total_rent
        self.offices.sum do |office|
            office.building.rent_per_floor
        end
    end
end
