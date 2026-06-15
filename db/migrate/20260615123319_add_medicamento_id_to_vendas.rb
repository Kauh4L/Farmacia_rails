class AddMedicamentoIdToVendas < ActiveRecord::Migration[7.2]
  def change
    add_reference :vendas, :medicamento, null: false, foreign_key: true
  end
end
