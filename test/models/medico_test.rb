require "test_helper"

class MedicoTest < ActiveSupport::TestCase
  test "deve salvar medico corretamente" do
    medico = Medico.new(nome_completo: 'Medico Teste', cpf: '11111111112', email: 'medico@gmail.com', especialidade: 'cardiologista', crm: '210637SP')
    assert medico.save
  end

  test "não deve salvar medico com campo CRM vazio" do
    medico = Medico.new(nome_completo: 'Medico Teste', cpf: '11111111112', email: 'medico@gmail.com', especialidade: 'cardiologista', crm: '')
    assert_not medico.save
  end

  test "não deve salvar Paciente com campo cpf vazio" do
    medico = Medico.new(nome_completo: 'Medico Teste', cpf: '', email: 'medico@gmail.com', especialidade: 'cardiologista', crm: '210637SP')
    assert_not medico.save
  end

  test "não deve salvar Paciente com campo email vazio" do
    medico = Medico.new(nome_completo: 'Medico Teste', cpf: '11111111112', email: '', especialidade: 'cardiologista', crm: '210637SP')
    assert_not medico.save
  end
end
