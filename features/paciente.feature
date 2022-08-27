Feature: Paciente
  As a paciente
  I want to adicionar, remover, vizualizar, e editar um paciente
  So that eu nao tenha que fazer isso manualmente ou presencialmente

  Scenario: criar paciente
    Given  estou na pagina de criar um novo paciente
    When crio um paciente de nome: 'Paciente01', data_nascimeto: '04-01-1999', cpf: '12345679568', email: 'paciente01@gmail.com', cidade: 'Recife',logradouro: 'rua zero',complemento: 'casa',bairro: 'Boa Viagem',cep: '55555555'
    And eu clico em criar paciente
    Then eu vejo uma mensagem que informa que o paciente foi criado com sucesso

  Scenario: remover paciente
    Given O paciente de nome: 'Paciente01', data_nascimeto: '04-01-1999', cpf: '12345679568', email: 'paciente01@gmail.com', cidade: 'Recife',logradouro: 'rua zero',complemento: 'casa',bairro: 'Boa Viagem',cep: '55555555' existe
    And estou na pagina do paciente com cpf '12345679568'
    When eu clico em remover o paciente
    Then eu vejo uma mensagem que informa que o paciente foi apagado com sucesso
