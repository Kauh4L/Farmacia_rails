class Medicamento < ApplicationRecord


  validates :preco, numericality: { greater_than: 0 }
  validates :estoque, numericality: { greater_than: 0 }
end