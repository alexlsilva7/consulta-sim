class Medico < ApplicationRecord
    has_many :consultums, dependent: :destroy

    validates :cpf , :email , :nome_completo, :especialidade, :crm, presence: true
    validates :cpf, numericality: { only_integer: true }
    validates :cpf, length: { is: 11}
    validates :crm, length: { is: 8}

    validates :nome_completo, :especialidade, length: { minimum: 5}
    validates :nome_completo, :especialidade, length: { maximum: 30}



    validates :email, :crm, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
