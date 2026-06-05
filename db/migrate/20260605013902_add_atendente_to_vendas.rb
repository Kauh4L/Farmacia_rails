class AddAtendenteToVendas < ActiveRecord::Migration[7.2]
  def change
    add_reference :vendas, :atendente, null: false, foreign_key: true
  end
end
