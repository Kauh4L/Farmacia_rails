# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#Criando cadastros de atendentes
Atendente.find_or_create_by!(nome: "Marcos", cpf: "12345678900", telefone: "11987654321")
Atendente.find_or_create_by!(nome: "Ana", cpf: "98765432100", telefone: "11912345678")
Atendente.find_or_create_by!(nome: "Fabiana", cpf: "11122233344", telefone: "11955555555")

#Criando cadastros de medicamentos 
Medicamento.find_or_create_by!(nome: "Dipirona", preco: 10.0, estoque: 100)
Medicamento.find_or_create_by!(nome: "Paracetamol", preco: 8.0, estoque: 150)
Medicamento.find_or_create_by!(nome: "Ibuprofeno", preco: 12.0, estoque: 80)
Medicamento.find_or_create_by!(nome: "Buscopan", preco: 20.0, estoque: 100)
Medicamento.find_or_create_by!(nome: "Cebion", preco: 15.0, estoque: 120) 

#Criando cadastros de vendas
Venda.find_or_create_by!(atendente_id: 1, medicamento_id: 1, quantidade: 2, total: 20.0)