require "test_helper"

class PacienteTest < ActiveSupport::TestCase
  test "deve salvar paciente corretamente" do
    endereco = Endereco.new(cidade: 'Recife', logradouro: 'rua rosa', complemento: 'casa', bairro: 'Boa Viagem', cep: '55555555')
    paciente = Paciente.new(nome_completo: 'Paciente Teste', data_nascimento: '10-10-1980', cpf: '11111111112', email: 'pacienteteste@gmail.com')

    paciente.endereco = endereco

    assert paciente.save
  end

  test "não deve salvar Paciente com campo data_nascimeto vazio" do
    endereco = Endereco.new(cidade: 'Recife', logradouro: 'rua rosa', complemento: 'casa', bairro: 'Boa Viagem', cep: '55555555')
    paciente = Paciente.new(nome_completo: 'Paciente Teste', data_nascimento: '', cpf: '11111111112', email: 'pacienteteste@gmail.com')

    paciente.endereco = endereco

    assert_not paciente.save
  end

  test "não deve salvar Paciente com campo cpf vazio" do
    endereco = Endereco.new(cidade: 'Recife', logradouro: 'rua rosa', complemento: 'casa', bairro: 'Boa Viagem', cep: '55555555')
    paciente = Paciente.new(nome_completo: 'Paciente Teste', data_nascimento: '10-10-1980', cpf: '', email: 'pacienteteste@gmail.com')

    paciente.endereco = endereco

    assert_not paciente.save
  end

  test "não deve salvar Paciente com campo email vazio" do
    endereco = Endereco.new(cidade: 'Recife', logradouro: 'rua rosa', complemento: 'casa', bairro: 'Boa Viagem', cep: '55555555')
    paciente = Paciente.new(nome_completo: 'Paciente Teste', data_nascimento: '10-10-1980', cpf: '11111111112', email: '')

    paciente.endereco = endereco

    assert_not paciente.save
  end


end
