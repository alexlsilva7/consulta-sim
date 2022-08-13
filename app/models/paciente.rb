class Paciente < ApplicationRecord
  has_one :endereco,dependent: :destroy
  has_many :consultums,dependent: :destroy
  accepts_nested_attributes_for :endereco

  validates :cpf , :email , :data_nascimento, :nome_completo, presence: true
  validates :cpf, numericality: { only_integer: true }
  validates :cpf, length: { is: 11}

  validates :nome_completo, length: { minimum: 5}
  validates :nome_completo, length: { maximum: 30}

  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates_each :data_nascimento do |record, attr, value|
    if !value.nil?
      record.errors.add attr, 'does not meet Terms of Service requirements (over 18)' if value > (18.years.ago).to_date
    end
  end
  validate :data_nascimento_future

  def data_nascimento_future
    if !data_nascimento.nil?
      if  data_nascimento > Date.today
        errors.add(:data_nascimento, "can't be in the future")
      end
    end

  end

end

