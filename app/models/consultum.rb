class Consultum < ApplicationRecord
  belongs_to :paciente
  belongs_to :medico

  validates :data , :horario, :medico_id, :paciente_id, presence: true

  validate :data_future
  validate :date_is_not_sunday

  validates_time :horario, :between => '9:00am'..'5:00pm'

  def data_future
    if !data.nil?
      if  data < Date.today
        errors.add(:data, "can't be in the past")
      end
    end
  end

  def date_is_not_sunday
    if data.present? && data.wday == 0
      errors.add(:date, "Date can't be sunday")
    end
  end
end
