class Cliente < ApplicationRecord
  validates :cpf, presence: true, uniqueness: true,
    format: { with: /\A\d{11}\z/, message: "deve estar no formato XXX.XXX.XXX-XX!!" }

  validates :telefone, presence: true,
    format: { with: /\A\d{11}\z/, message: "deve estar no formato (XX) XXXXX-XXXX" }
end