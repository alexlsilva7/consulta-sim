require "test_helper"

class ConsultumTest < ActiveSupport::TestCase
  test "deve salvar consulta corretamente" do
    endereco = Endereco.new(cidade: 'Recife', logradouro: 'rua rosa', complemento: 'casa', bairro: 'Boa Viagem', cep: '55555555')
    paciente = Paciente.new(nome_completo: 'Paciente Teste', data_nascimento: '10-10-1980', cpf: '11111111112', email: 'pacienteteste@gmail.com')
    paciente.endereco = endereco
    paciente.save

    medico = Medico.new(nome_completo: 'Medico Teste', cpf: '11111111112', email: 'medico@gmail.com', especialidade: 'cardiologista', crm: '210637SP')
    assert medico.save

    consulta = Consultum.new(data: '10-10-2022', horario: '10:30', medico_id: medico.id, paciente_id: paciente.id)
    assert consulta.save()
  end

  test "Nao deve salvar uma consulta sem paciente" do

    medico = Medico.new(nome_completo: 'Medico Teste', cpf: '11111111112', email: 'medico@gmail.com', especialidade: 'cardiologista', crm: '210637SP')
    assert medico.save

    consulta = Consultum.new(data: '10-10-2022', horario: '10:30', medico_id: medico.id)
    assert_not consulta.save()

  end

  test "Nao deve salvar uma consulta sem medico" do

    endereco = Endereco.new(cidade: 'Recife', logradouro: 'rua rosa', complemento: 'casa', bairro: 'Boa Viagem', cep: '55555555')
    paciente = Paciente.new(nome_completo: 'Paciente Teste', data_nascimento: '10-10-1980', cpf: '11111111112', email: 'pacienteteste@gmail.com')
    paciente.endereco = endereco
    paciente.save

    consulta = Consultum.new(data: '10-10-2022', horario: '10:30', paciente_id: paciente.id)
    assert_not consulta.save()
  end

  test "Nao deve salvar uma consulta com uma data que ja passou" do
    endereco = Endereco.new(cidade: 'Recife', logradouro: 'rua rosa', complemento: 'casa', bairro: 'Boa Viagem', cep: '55555555')
    paciente = Paciente.new(nome_completo: 'Paciente Teste', data_nascimento: '10-10-1980', cpf: '11111111112', email: 'pacienteteste@gmail.com')
    paciente.endereco = endereco
    paciente.save

    medico = Medico.new(nome_completo: 'Medico Teste', cpf: '11111111112', email: 'medico@gmail.com', especialidade: 'cardiologista', crm: '210637SP')
    assert medico.save

    consulta = Consultum.new(data: '01-01-2021', horario: '10:30', medico_id: medico.id, paciente_id: paciente.id)
    assert_not consulta.save()
  end
end
