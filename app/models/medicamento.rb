class Medicamento < ApplicationRecord


  validates :preco, numericality: { greater_than: 0 }
  validates :estoque, numericality: { greater_than: 0 }

  def self.to_csv
    attributes = %w{id nome preco estoque}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |medicamento|
        csv << attributes.map{ |attr| medicamento.send(attr) }
      end
    end
  end
end