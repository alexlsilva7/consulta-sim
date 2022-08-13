class Endereco < ApplicationRecord
  belongs_to :paciente

  validates :cidade, :bairro, :logradouro, :complemento, :cep, presence: true

  validates :cep, length: {is:8}
  validates :cep, numericality: { only_integer: true }

  validates :cidade, :bairro, :logradouro, :complemento, length: { minimum: 4}
  validates :cidade, :bairro, :logradouro, :complemento, length: { maximum: 30}




end
