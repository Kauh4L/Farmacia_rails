class AddMedicamentoToVendas < ActiveRecord::Migration[7.2]
  def change
  add_column :vendas, :quantidade, :integer unless column_exists?(:vendas, :quantidade)
  end
end
