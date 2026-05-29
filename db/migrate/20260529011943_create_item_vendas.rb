class CreateItemVendas < ActiveRecord::Migration[7.2]
  def change
    create_table :item_vendas do |t|
      t.references :venda, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true
      t.integer :quantidade
      t.decimal :preco_unitario

      t.timestamps
    end
  end
end
