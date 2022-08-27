Given('estou na pagina de criar um novo paciente') do
  visit '/pacientes/new'
end

When('crio um paciente de nome: {string}, data_nascimeto: {string}, cpf: {string}, email: {string}, cidade: {string},logradouro: {string},complemento: {string},bairro: {string},cep: {string}') do |nome, data_nascimeto, cpf, email, cidade, logradouro, complemento, bairro, cep|
  fill_in 'paciente[nome_completo]', :with => nome
  fill_in 'paciente[data_nascimento]', :with => data_nascimeto
  fill_in 'paciente[cpf]', :with => cpf
  fill_in 'paciente[email]', :with => email
  fill_in 'paciente[endereco_attributes][cep]', :with => cep
  fill_in 'paciente[endereco_attributes][cidade]', :with => cidade
  fill_in 'paciente[endereco_attributes][bairro]', :with => bairro
  fill_in 'paciente[endereco_attributes][logradouro]', :with => logradouro
  fill_in 'paciente[endereco_attributes][complemento]', :with => complemento
end

When('eu clico em criar paciente') do
  click_button 'Create Paciente'
end

Then('eu vejo uma mensagem que informa que o paciente foi criado com sucesso') do
  page.has_content?('Paciente was successfully created.')
end
