class CreateAtendentes < ActiveRecord::Migration[7.2]
  def change
    create_table :atendentes do |t|
      t.string :nome
      t.string :cpf
      t.string :telefone

      t.timestamps
    end
  end
end
