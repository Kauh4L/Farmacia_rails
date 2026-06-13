class RemoveClienteFromVendas < ActiveRecord::Migration[7.2]
  def change
    remove_reference :vendas, :cliente, null: false, foreign_key: true
  end
end
