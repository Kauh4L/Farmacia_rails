# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2026_06_05_013902) do
  create_table "atendentes", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicamentos", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "nome"
    t.string "preco"
    t.string "estoque"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendas", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.decimal "total", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "atendente_id", null: false
    t.index ["atendente_id"], name: "index_vendas_on_atendente_id"
    t.index ["cliente_id"], name: "index_vendas_on_cliente_id"
  end

  add_foreign_key "vendas", "atendentes"
  add_foreign_key "vendas", "clientes"
end
