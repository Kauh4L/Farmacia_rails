class CreateMedicamentos < ActiveRecord::Migration[7.2]
  def change
    create_table :medicamentos do |t|
      t.string :nome
      t.string :preco
      t.string :estoque

      t.timestamps
    end
  end
end
