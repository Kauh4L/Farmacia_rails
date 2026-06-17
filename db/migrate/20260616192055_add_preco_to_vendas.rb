class AddPrecoToVendas < ActiveRecord::Migration[7.2]
  def change
    add_column :vendas, :preco, :decimal
  end
end
