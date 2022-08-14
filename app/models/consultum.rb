class Consultum < ApplicationRecord
  belongs_to :paciente
  belongs_to :medico

  validates :data , :horario, :medico_id, :paciente_id, presence: true

end
