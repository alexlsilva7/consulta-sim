Given('que existe um medico de nome {string}, cpf {string}, email {string}, especialidade {string} e  crm {string}') do |nome, cpf, email, especialidade, crm|
  visit '/medicos/new'
  fill_in 'medico[nome_completo]', :with => nome
  fill_in 'medico[cpf]', :with => cpf
  fill_in 'medico[email]', :with => email
  fill_in 'medico[especialidade]', :with => especialidade
  fill_in 'medico[crm]', :with => crm
  click_button 'Create Medico'
  visit '/medicos'
end

Given('estou na pagina do medico com cpf {string}') do |cpf|
  visit "/medicos/#{Medico.find_by_cpf(cpf).id}"
end

When('clico em editar medico') do
  click_link 'Edit'
end

When('alterar o email para {string}') do |email|
  fill_in 'medico[email]', :with => email
end

When('clico em update medico') do
  click_button 'Update Medico'
end

Then('eu vejo uma mensagem que informa que o medico foi atualizado com sucesso') do
  page.has_content?('Medico was successfully updated.')
  end

Then('eu vejo uma mensagem que o email e invalido') do
  page.has_content?('Email is invalid.')
end