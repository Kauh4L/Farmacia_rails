class CreateClientes < ActiveRecord::Migration[7.2]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :cpf
      t.string :telefone

      t.timestamps
    end
  end
end
