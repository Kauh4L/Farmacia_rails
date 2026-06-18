class Venda < ApplicationRecord
  belongs_to :atendente
  belongs_to :medicamento

  before_save :calcular_total

  def calcular_total
    self.total = quantidade.to_i * medicamento.preco.to_f
  end

  def self.to_csv
    attributes = %w{id atendente_id medicamento_id quantidade total}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |venda|
        csv << attributes.map{ |attr| venda.send(attr) }
      end
    end
  end
end