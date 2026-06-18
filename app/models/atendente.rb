class Atendente < ApplicationRecord
  has_many :vendas

 validates :cpf, presence: true, uniqueness: true,
    format: { with: /\A\d{11}\z/, message: "deve estar no formato XXX.XXX.XXX-XX!!" }

  validates :telefone, presence: true,
    format: { with: /\A\d{11}\z/, message: "deve estar no formato (XX) XXXXX-XXXX" }

  def self.to_csv
    attributes = %w{id nome cpf telefone}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |atendente|
        csv << attributes.map{ |attr| atendente.send(attr) }
      end
    end
  end

end
