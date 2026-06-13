class Venda < ApplicationRecord
  belongs_to :atendente
  belongs_to :medicamento

  before_save :calcular_total

  def calcular_total
  self.total = quantidade.to_i * medicamento.preco.to_f
  end
end