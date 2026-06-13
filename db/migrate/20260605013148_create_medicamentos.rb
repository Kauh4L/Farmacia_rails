class CreateMedicamentos < ActiveRecord::Migration[7.2]
  def change
    create_table :medicamentos do |t|
      t.string :nome
      t.decimal :preco
      t.decimal :estoque

      t.timestamps
    end
  end
end
