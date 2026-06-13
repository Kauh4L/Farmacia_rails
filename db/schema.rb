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

ActiveRecord::Schema[7.2].define(version: 2026_06_13_173846) do
  create_table "atendentes", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_vendas", force: :cascade do |t|
    t.integer "venda_id", null: false
    t.integer "medicamento_id", null: false
    t.integer "quantidade_id", null: false
    t.integer "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medicamento_id"], name: "index_item_vendas_on_medicamento_id"
    t.index ["quantidade_id"], name: "index_item_vendas_on_quantidade_id"
    t.index ["venda_id"], name: "index_item_vendas_on_venda_id"
  end

  create_table "medicamentos", force: :cascade do |t|
    t.string "nome"
    t.string "preco"
    t.string "estoque"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendas", force: :cascade do |t|
    t.decimal "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "atendente_id", null: false
    t.integer "medicamento_id", null: false
    t.integer "quantidade"
    t.index ["atendente_id"], name: "index_vendas_on_atendente_id"
    t.index ["medicamento_id"], name: "index_vendas_on_medicamento_id"
  end

  add_foreign_key "item_vendas", "medicamentos"
  add_foreign_key "item_vendas", "quantidades"
  add_foreign_key "item_vendas", "vendas"
  add_foreign_key "vendas", "atendentes"
  add_foreign_key "vendas", "medicamentos"
end
