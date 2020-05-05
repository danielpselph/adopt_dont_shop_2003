class Pet < ApplicationRecord
    validates_presence_of :name, :image, :age, :sex
    validates :adoption_status, inclusion: [true, false]
    belongs_to :shelter
end