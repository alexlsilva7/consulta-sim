class Paciente < ApplicationRecord
  has_one :endereco,dependent: :destroy
  has_many :consultums,dependent: :destroy
  accepts_nested_attributes_for :endereco
end

