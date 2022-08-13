class Medico < ApplicationRecord
    has_many :consultums,dependent: :destroy
end
