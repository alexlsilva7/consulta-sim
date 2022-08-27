Feature: Editar Medico
  As a medico
  I want to editar os dados de um medico
  So that para manter o cadastro dos medicos atualizado

  Scenario: editar medico corretamente
    Given que existe um medico de nome 'Medico um', cpf '45645645688', email 'medico1@g.com', especialidade 'Cardiologista' e  crm '12345678'
    And estou na pagina do medico com cpf '45645645688'
    When clico em editar medico
    And alterar o email para 'medico2@g.com'
    And clico em update medico
    Then eu vejo uma mensagem que informa que o medico foi atualizado com sucesso

  Scenario: editar medico com email invalido
    Given que existe um medico de nome 'Medico um', cpf '45645645688', email 'medico1@g.com', especialidade 'Cardiologista' e  crm '12345678'
    And estou na pagina do medico com cpf '45645645688'
    When clico em editar medico
    And alterar o email para ''
    And clico em update medico
    Then eu vejo uma mensagem que o email e invalido
